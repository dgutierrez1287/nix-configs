#!/usr/bin/env bash

# Constants
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
SSH_OPTIONS_PASS="-o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"
SSH_OPTIONS_KEY="-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no"

# Args
task=$1
laptop_name=$2
ip_address=$3

## Functions ##
function laptopInstall() {
    
    echo "running install of nixos on laptop ${laptop_name}"
    echo " "

    if [ "${laptop_name}" == "dell-studio" ]; then
        echo "partitioning drive for dell-studio"
        echo ""

        sshpass -proot ssh ${SSH_OPTIONS_PASS} root@${ip_address} " \
            parted /dev/sda -- mklabel msdos; \
            parted /dev/sda -- mkpart primary 512MiB -8GiB; \
            parted /dev/sda -- mkpart primary linux-swap -8GiB 100\%; \
            mkfs.ext4 -L nixos /dev/sda1; \
            mkswap -L swap /dev/sda2; \
            mount /dev/disk/by-label/nixos /mnt
        "

    elif [ "${laptop_name}" == "m4700" ]; then
        echo "partitioning drive for m4700"
        echo ""

    else 
        echo "unknown laptop, please update the script, exiting..."
    fi

    echo "running common config commands"
    echo ""

    sshpass -proot ssh ${SSH_OPTIONS_PASS} root@${ip_address} " \
        nixos-generate-config --root /mnt; \
        sed --in-place '/system\.stateVersion = .*/a \
            nix.package = pkgs.nixUnstable;\n \
            nix.extraOptions = \"experimental-features = nix-command flakes\";\n \
            services.openssh.enable = true;\n \
            services.openssh.passwordAuthentication = true;\n \
            services.openssh.permitRootLogin = \"yes\";\n \
            users.users.root.initialPassword = \"root\";\n \
        ' /mnt/etc/nixos/configuration.nix; \
    "

    if [ "${laptop_name}" == "dell-studio" ]; then
        echo "putting grub configuration in for dell-studio"
        echo ""

        sshpass -proot ssh ${SSH_OPTIONS_PASS} root@${ip_address} " \
            sed --in-place '/system\.stateVersion = .*/a \
            boot.loader.grub.device = \"/dev/sdb\"; \
            ' /mnt/etc/nixos/configuration.nix
        "
    fi

    echo "running install"
    echo ""

    sshpass -proot ssh ${SSH_OPTIONS_PASS} root@${ip_address} "nixos-install --no-root-password"
}

function copySshKey() {
    
    echo "copying the local primary ssh key to the laptop"
    echo ""

    echo "ensuring the ssh directory is present"
    ssh -i ~/.ssh/id_rsa ${SSH_OPTIONS_KEY} diego@${ip_address} "mkdir -p /home/diego/.ssh"

    echo "copying the ssh private key"
    scp -i ~/.ssh/id_rsa ${SSH_OPTIONS_KEY} ~/.ssh/id_rsa diego@${ip_address}:/home/diego/.ssh/id_rsa

    echo "correcting private key permissions"
    ssh -i ~/.ssh/id_rsa ${SSH_OPTIONS_KEY} diego@${ip_address} "chmod 700 /home/diego/.ssh/id_rsa"

    echo "copying the ssh public key"
    scp -i ~/.ssh/id_rsa.pub ${SSH_OPTIONS_KEY} ~/.ssh/id_rsa.pub diego@${ip_address}:/home/diego/.ssh/id_rsa.pub

    echo "correcting public key permissions"
    ssh -i ~/.ssh/id_rsa ${SSH_OPTIONS_KEY} diego@${ip_address} "chmod 744 /home/diego/.ssh/id_rsa.pub"

    echo ""
}

function remoteCopyNixCode() {

    echo "rsyncing the local nix config to the laptop to bootstrap"
    echo ""

    sshpass -proot rsync -av -e "ssh ${SSH_OPTIONS_PASS}" \
        --exclude='vendor/' \
        --exclude='.git/' \
        --exclude='.git-crypt/' \
        --exclude='packer/' \
        --exclude='vmconfig.json.example' \
        --exclude='.gitignore' \
        --exclude='iso/' \
        --rsync-path="sudo rsync" \
        ${SCRIPT_DIR}/* root@${ip_address}:/nix-config/

    echo ""
    echo "copying the local hardware config to the laptops nixconfig directory"

    sshpass -proot ssh ${SSH_OPTIONS_PASS} root@${ip_address} \
    "cp /etc/nixos/hardware-configuration.nix /nix-config/hardware/hardware-configuration.nix"
}

function remoteNixRun() {
    echo "running nix switch for the laptop with flakename ${laptop_name}"
    echo ""

    sshpass -proot ssh ${SSH_OPTIONS_PASS} root@${ip_address} " \
            sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch --flake \"/nix-config#${laptop_name}\" \
        "
}


## Main ##

if [[ "${task}" != "help" ]]; then

    echo "laptop_name: ${laptop_name}"
    echo "ip_address: ${ip_address}"
    echo ""
    echo ""
fi

case $task in

    "laptop-install")
        laptopInstall
    ;;

    "bootstrap")
        remoteCopyNixCode
        remoteNixRun

    ;;

    "copy-ssh")
        copySshKey
    ;;

    "help")

        echo "laptop.sh"
        echo "Script to boostrap a NixOS install on a hardware laptop, This script must be updated for partitioning of the machine"
        echo ""
        echo "usage: laptop.sh <task name> <laptop name> <ip address>"
        echo ""
        echo "Tasks:"
        echo "laptop-install - Configures the disk and installs Nixos onto the laptop"
        echo "bootstrap - Runs nixconfig for the first time to prime the system"
        echo "copy-ssh - Copies the default private key from this machine"

    ;;

    *)
        echo "Unknown task"
        exit 123
    ;;

esac
