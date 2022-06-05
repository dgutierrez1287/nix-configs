{lib, config, pkgs, ...}:

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
				src = ./conf/zsh/p10k.zsh;
				file = "p10k.zsh";
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
			la = "ls -la";
			ll = "ls -l";
			tf = "terraform";
			d = "docker";
			dcc = "docker compose";
			dc = "docker-compose";
			dockergc = "docker system prune -f";
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