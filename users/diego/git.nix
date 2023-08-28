{config, lib, pkgs, ...}:

{
	programs.git = {
		enable = true;
		userName = "Diego Gutierrez";
		userEmail = "dgutierrez1287@gmail.com";
		aliases = {
			prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
            st = "status";
            last = "log -1 HEAD --stat";
            cm = "commit -m";
            bl = "branches";
            br = "branch";
            se = "!git rev-list --all | xargs git grep -F";
            pb = "push origin";
            plb = "pull origin";
            pm = "push origin master";
            plm = "pull origin master";
            a = "add";
            aa = "add -A";
		};
		extraConfig = {
			core.fileMode = true;
			color.ui = true;
			github.user = "dgutierrez1287";
		};
	};
}
