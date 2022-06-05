{lib, config, pkgs, machineUse, machineType, guiType, flakeName, ...}:{

	# general session values
	home.sessionVariables = {
		FLAKENAME = flakeName;
	};

	imports = [
		./base_packages.nix
		./tmux.nix
		./zsh.nix
		./git.nix
	] 
	++ (if machineUse == "dev"
	   then [
		   ./neovim.nix
		   ./dev_packages.nix
		   ./file_browser.nix
		   ./powershell.nix
	   ]
	   else[])
	++ (if guiType == "gui"
	   then []
	   else []);
}