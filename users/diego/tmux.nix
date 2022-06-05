{lib, config, pkgs, ...}: 

{
	programs.tmux = {
		enable = true;
		terminal = "xterm-256color";
		clock24 = true;
		keyMode = "vi";
		plugins = with pkgs; [
			tmuxPlugins.resurrect
			tmuxPlugins.continuum
			tmuxPlugins.yank
		];		
		extraConfig = ''
			# Force reload of config file
			unbind r
			bind-key r run-shell '\
				tmux source-file /etc/tmux.conf > /dev/null; \
				tmux display-message "sourced /etc/tmux.conf"'

			# toggle synchronized-panes
			bind C-x setw synchronize-panes
			setw -g window-status-current-format '#{?pane_synchronized,#[bg=red],}#I:#W:#F'
			setw -g window-status-format '#{?pane_synchronized,#[bg=red],}#I:#W:#F'

			# set new panes to open in current directory
			bind '"' split-window -c "#{pane_current_path}"
			bind % split-window -h -c "#{pane_current_path}"

			# resurrect restore
			set -g @resurrect-restore 'R'

			# shell settings
			set -g default-shell $SHELL
			set -g default-command "$SHELL --login"

			# UI settings
			set -g status-right 'Continuum status: #{continuum_status}

			# continuum settings
			set -g @continuum-save-interval '10'
			set -g @continuum-restore 'on'
		'';
	};
}