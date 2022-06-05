{config, lib, pkgs, ...}:

{
	programs.git = {
		enable = true;
		userName = "Diego Gutierrez";
		userEmail = "dgutierrez1287@gmail.com";
		aliases = {
			prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
		};
		extraConfig = {
			core.fileMode = true;
			color.ui = true;
			github.user = "dgutierrez1287";
		};
	};
}