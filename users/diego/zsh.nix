{lib, config, pkgs, os, ...}:
{ 

	programs.zsh = {
		enable = true;
		enableAutosuggestions = true;
		enableCompletion = true;
		enableSyntaxHighlighting = true;

		plugins = with pkgs; [
			{
				name = "powerlevel10k";
				src = pkgs.zsh-powerlevel10k;
				file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
			}
			{
				name = "powerlevel10k-config";
				src = lib.cleanSource ./conf/zsh/p10k-config;
                file = "./p10k.zsh";
			}
		];

		oh-my-zsh = {
			enable = true;
			plugins = [
				"docker"
				"git"
				"sudo"
			];
		};

		shellAliases = {
            # general
			la = "ls -la";
			ll = "ls -l";

            # Terraform
			tf = "terraform";

            # docker
			d = "docker";
			dcc = "docker compose";
			dc = "docker-compose";
			dockergc = "docker system prune -f";

            # tmux
            t = "tmux";
            ta = "tmux a -t";
            tls = "tmux ls";
            tn = "tmux new -t";
            tkser = "tmux kill-server";
            tks = "tmux kill-session -t";

            # vim to nvim NOTE: there is an issue on darwin not honoring 
            # vim binding from nvim program config
            vi = "nvim";
            vim = "nvim";
		};

        initExtra = builtins.readFile ./conf/zsh/zshrc;

		initExtraBeforeCompInit = ''
			source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

			# p10k instant prompt
      		P10K_INSTANT_PROMPT="$XDG_CACHE_HOME/p10k-instant-prompt-''${(%):-%n}.zsh"
      		[[ ! -r "$P10K_INSTANT_PROMPT" ]] || source "$P10K_INSTANT_PROMPT"
		'';
	};
}
