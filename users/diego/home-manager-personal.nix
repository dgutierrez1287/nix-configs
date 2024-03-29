{lib, config, pkgs, machineUse, machineType, os, guiType, flakeName, currentSystem, ...}:{

	# general session values
	home.sessionVariables = {
		FLAKENAME = flakeName;
        OS_TYPE = os;
        MACHINE_TYPE = machineType;
	};

	imports = [
		./base_packages.nix
		./tmux.nix
		./zsh.nix
		./bash.nix
		./git.nix
	] 
	++ (if machineUse == "dev"
	   then [
		   ./neovim.nix
		   ./dev_packages.nix
		   ./powershell.nix
	   ]
       else[])
       ++ (if (machineUse == "dev" && guiType == "no-gui")
       then[
          ./file_browser.nix
       ]
       else[])
       ++ (if (guiType == "gui" && os != "Darwin")
       then [
          ./gui_packages.nix
       ]
       else[]);
}
