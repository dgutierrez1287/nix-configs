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
            tmuxPlugins.extrakto
            tmuxPlugins.copycat
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

            unbind -T copy-mode-vi Space; #Default for begin-selection
            unbind -T copy-mode-vi Enter; #Default for copy-selection

            bind -T copy-mode-vi v send-keys -X begin-selection
            bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "xsel --clipboard"

            # Use vi keybindings for tmux commandline input.
            # Note that to get command mode you need to hit ESC twice...
            set -g status-keys vi

            # bind-key -T copy-mode-vi v send -X begin-selection
            bind-key -T copy-mode-vi V send -X select-line
            bind-key -T copy-mode-vi y send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'

			# set new panes to open in current directory
            bind i split-window -c "#{pane_current_path}" # open horizontal split in the same directory as the current one
			bind s split-window -h -c "#{pane_current_path}" # open vertical split in the same directory as the current one
            unbind '"'
            unbind %

            # swapping panes 
            bind > swap-pane -D       # swap current pane with the next one
            bind < swap-pane -U       # swap current pane with the previous one

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
