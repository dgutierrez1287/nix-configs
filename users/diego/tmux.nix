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
            tmuxPlugins.vim-tmux-navigator
			tmuxPlugins.yank
		];		
		extraConfig = ''
            # reload config key binding 
            bind r source-file ~/.config/tmux/tmux.conf \; display 'sourced ~/.config/tmux/tmux.conf'

			# toggle synchronized-panes
			bind C-x setw synchronize-panes
			setw -g window-status-current-format '#{?pane_synchronized,#[bg=red],}#I:#W:#F'
			setw -g window-status-format '#{?pane_synchronized,#[bg=red],}#I:#W:#F'

            # Use vi keybindings in copy and choice modes
            setw -g mode-keys vi

            # Use vi keybindings for tmux commandline input.
            # Note that to get command mode you need to hit ESC twice...
            set -g status-keys vi

			# set new panes to open in current directory
			bind '-' split-window -c "#{pane_current_path}"
			bind | split-window -h -c "#{pane_current_path}"
            unbind '"'
            unbind %

			# resurrect restore
			set -g @resurrect-restore 'R'

            # turn off renaming 
            set-option -g allow-rename off

            # binding to resize-window
            bind w resize-window -A \; display 'resizing window'


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
