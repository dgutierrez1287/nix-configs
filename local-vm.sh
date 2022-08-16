#!/bin/bash

# Constants
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SSH_OPTIONS_PASS="-o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
SSH_OPTIONS_KEY="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
# Args
task=$1
vm_name=$2


## Functions ##

# vmInstall #
# Installs and configures nixos on a new VM
function vmInstall() {
    blockDevice=( $(cat ${SCRIPT_DIR}/vmconfig.json | jq -r --arg name "${vm_name}" \
        '.vms[] | select (.vmName == $name) | .blockDevice') )

	echo "running install of nixos on the VM"
	echo " "

	sshpass -proot ssh ${SSH_OPTIONS_PASS} root@${vm_ip} " \
		parted /dev/${blockDevice} -- mklabel gpt; \
		parted /dev/${blockDevice} -- mkpart primary 512MiB -8GiB; \
		parted /dev/${blockDevice} -- mkpart primary linux-swap -8GiB 100\%; \
		parted /dev/${blockDevice} -- mkpart ESP fat32 1MiB 512MiB; \
		parted /dev/${blockDevice} -- set 3 esp on; \
		mkfs.ext4 -L nixos /dev/${blockDevice}1; \
		mkswap -L swap /dev/${blockDevice}2; \
		mkfs.fat -F 32 -n boot /dev/${blockDevice}3; \
		mount /dev/disk/by-label/nixos /mnt; \
		mkdir -p /mnt/boot; \
		mount /dev/disk/by-label/boot /mnt/boot; \
		nixos-generate-config --root /mnt; \
		sed --in-place '/system\.stateVersion = .*/a \
			nix.package = pkgs.nixUnstable;\n \
			nix.extraOptions = \"experimental-features = nix-command flakes\";\n \
  			services.openssh.enable = true;\n \
			services.openssh.passwordAuthentication = true;\n \
			services.openssh.permitRootLogin = \"yes\";\n \
			users.users.root.initialPassword = \"root\";\n \
		' /mnt/etc/nixos/configuration.nix; \
		nixos-install --no-root-passwd; \
	"
}

#function copySecrets() {

#}

function copySshKeys() {

	# Get ssh key names (friendly names used to identify the key)
	keynameArr=( $(cat ${SCRIPT_DIR}/vmconfig.json | jq -r --arg name "${vm_name}" \
		'.vms[] | select (.vmName == $name) | .sshKeys[].keyname') )

	# get username to copy the keys with
	username=$(cat ${SCRIPT_DIR}/vmconfig.json | jq -r --arg name "${vm_name}" \
		'.vms[] | select (.vmName == $name) | .username')

	keyfile=$(cat ${SCRIPT_DIR}/vmconfig.json | jq -r --arg name "${vm_name}" \
		'.vms[] | select (.vmName == $name) | .keyFile')


	echo "keys to copy: ${keynameArr[@]}"
	echo "username: ${username}"
	echo "keyfile: ${keyfile}"
	echo ""
	echo ""

	# loop through all ssh keys 
	for key_name in "${keynameArr[@]}"
	do
		echo "copying ssh private key ${key_name}"
		echo " "

		# get key local path
		local_path=$(cat ${SCRIPT_DIR}/vmconfig.json | jq -r --arg vm_name "${vm_name}" \
			--arg key_name "${key_name}" \
			'.vms[] | select (.vmName == $vm_name) | .sshKeys[] | select (.keyname == $key_name) | .localPath')

		# get key remote path
		remote_path=$(cat ${SCRIPT_DIR}/vmconfig.json | jq -r --arg vm_name "${vm_name}" \
			--arg key_name "${key_name}" \
			'.vms[] | select (.vmName == $vm_name) | .sshKeys[] | select (.keyname == $key_name) | .remotePath')

		echo "local path: ${local_path}"
		echo "remote path: ${remote_path}"

		# get containing directory for key and ensure the directory is created
		parent_dir=$(echo ${remote_path} | sed -n -e '1p' | sed  -e 's#//*#/#g' -e 's#\(.\)/$#\1#' -e 's#^[^/]*$#.#' -e 's#\(.\)/[^/]*$#\1#' -)

		echo "ensuring the parent directory for the ssh key is present"
		ssh -i ${keyfile} ${SSH_OPTIONS_KEY} ${username}@${vm_ip} "mkdir -p ${parent_dir}"

		## Private Key ##

		# copy the key
		echo "copying the ssh private key"
		scp -i ${keyfile} ${SSH_OPTIONS_KEY} ${local_path} ${username}@${vm_ip}:${remote_path}

		# correct the private key permissions
		echo "correcting the permissions for the private key"
		ssh -i ${keyfile} ${SSH_OPTIONS_KEY} ${username}@${vm_ip} "chmod 700 ${remote_path}"
		echo ""

		## Public Key ##
		# copy the key
		echo "copying the ssh public key"
		scp -i ${keyfile} ${SSH_OPTIONS_KEY} "${local_path}.pub" ${username}@${vm_ip}:"${remote_path}.pub"

		# correct the private key permissions
		echo "correcting the permissions for the public key"
		ssh -i ${keyfile} ${SSH_OPTIONS_KEY} ${username}@${vm_ip} "chmod 744 ${remote_path}.pub"

		echo ""
		echo ""
	done
}

# copyNixCode #
function remoteCopyNixCode() {

	echo "rsyncing the local nix config to the VM to bootstrap"
	echo " "

	# copy nix code to the new vm
	sshpass -proot rsync -av -e "ssh ${SSH_OPTIONS_PASS}" \
		--exclude='vendor/' \
		--exclude='.git/' \
		--exclude='.git-crypt/' \
		--exclude='packer/' \
		--exclude='vmconfig.json.example' \
		--exclude='.gitignore' \
        --exclude='iso/' \
		--rsync-path="sudo rsync" \
		${SCRIPT_DIR}/* root@${vm_ip}:/nix-config/

	echo " "
	echo "copying the local hardware config to the vm nixconfig directory"

	# copy hardware config that was created during install
	sshpass -proot ssh ${SSH_OPTIONS_PASS} root@${vm_ip} \
	"cp /etc/nixos/hardware-configuration.nix /nix-config/hardware/hardware-configuration.nix"	
}

function remoteNixRun() {
	echo "running nix switch for VM with flakename ${flake_name}"
	echo " "

	sshpass -proot ssh ${SSH_OPTIONS_PASS} root@${vm_ip} " \
		sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch --flake \"/nix-config#${flake_name}\" \
	"
}


## Main ##

if [[ "${task}" != "help" ]]; then

	vm_ip=$(cat ${SCRIPT_DIR}/vmconfig.json | jq -r --arg name "${vm_name}" \
		'.vms[] | select (.vmName == $name) | .ip')
    flake_name=$(cat ${SCRIPT_DIR}/vmconfig.json | jq -r --arg name "${vm_name}" \
		'.vms[] | select (.vmName == $name) | .flakeName')

	echo "vmName: ${vm_name}"
	echo "vmIP: ${vm_ip}"
	echo "flakeName: ${flake_name}"
	echo ""
	echo ""
	
fi

case $task in 

"vm-install")
	vmInstall
;;

"bootstrap")
	remoteCopyNixCode
	remoteNixRun
;;

"copy-ssh")
	copySshKeys
;;

"help")

echo "local-vm.sh"
echo "Script to manage local NixOS dev VMs, NOTE: to use this the vmconfig.json must be accurate"
echo ""
echo "usage: local-vm.sh <task name> <vm name>"
echo ""
echo "Tasks:"
echo "vm-install - Configures the disk and installs NixOS onto a new VM" 
echo "bootstrap - Runs nixconfig the first time to prime the system (can be run mutilple times if debugging new system)"
echo "copy-ssh - Copies the desired private ssh keys to the VM from the local system"

;;

*)
	echo "Unknown task"
	exit 123
;;

esac
