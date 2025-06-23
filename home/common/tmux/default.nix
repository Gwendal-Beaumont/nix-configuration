{ inputs, config, lib, pkgs, ... }:

{
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    clock24 = true;
    prefix = "C-a";
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "xterm-256color";
    escapeTime = 20;
    newSession = true;
    mouse = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      battery
      resurrect
      continuum
    ];

    extraConfig = ''
unbind-key C-b
bind-key C-s send-prefix

# Set colorset option
set-option -ga terminal-overrides ",xterm-256color:Tc"

# enable clipboard
set-option -g set-clipboard on

# split windows
bind-key v split-window -h
bind-key h split-window -v

# swap windows
bind-key -n C-S-Left swap-window -t -1\; select-window -t -1
bind-key -n C-S-Right swap-window -t +1\; select-window -t +1

# move between windows
bind-key -n S-Left previous-window
bind-key -n S-Right next-window

# move between panes
bind-key -n M-Up select-pane -U
bind-key -n M-Down select-pane -D
bind-key -n M-Left select-pane -L
bind-key -n M-Right select-pane -R

# config file reload
bind-key r source-file $HOME/.config/tmux/tmux.conf \; display-message "Config file reloaded."

# Status Bar
set -g status-justify left
set -g status-interval 60
set -g status-left-length 50
set -g status-right "#{battery_status_bg} #{battery_percentage} | %d/%m/%y | %H:%M "

# List of plugins
run-shell "${pkgs.tmuxPlugins.sensible}/share/tmux-plugins/sensible/sensible.tmux"
run-shell "${pkgs.tmuxPlugins.yank}/share/tmux-plugins/yank/yank.tmux"
run-shell "${pkgs.tmuxPlugins.battery}/share/tmux-plugins/battery/battery.tmux"
run-shell "${pkgs.tmuxPlugins.resurrect}/share/tmux-plugins/resurrect/resurrect.tmux"
run-shell "${pkgs.tmuxPlugins.continuum}/share/tmux-plugins/continuum/continuum.tmux"
set -g @continuum-restore 'on'
    '';
  };
}
