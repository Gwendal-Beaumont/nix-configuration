{ inputs, ... }:

{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
    enable = true;
    # systemd.enable = true;
    # hyprland.enable = true;
    # overwrite.enable = true;
    #
    # layout = {
    #   "bar.layouts" = {
    #     "*" = {
    #       left = [ "dashboard" "updates" "workspaces" ];
    #       middle = [ "media" ];
    #       right = [ "volume" "battery" "bluetooth" "network" "systray" "clock" "notifications" ];
    #     };
    #   };
    # };
    #
    # # Configure and theme almost all options from the GUI.
    # # Options that require '{}' or '[]' are not yet implemented,
    # # except for the layout above.
    # # See 'https://hyprpanel.com/configuration/settings.html'.
    # # Default: <same as gui>
    # settings = {
    #   bar.launcher.autoDetectIcon = true;
    #   bar.workspaces.show_icons = true;
    #
    #   menus.clock = {
    #     time = {
    #       military = true;
    #       hideSeconds = true;
    #     };
    #     weather.unit = "metric";
    #   };
    #
    #   menus.dashboard.directories.enabled = false;
    #
    #   theme.bar.transparent = true;
    #
    #   theme.font = {
    #     name = "CaskaydiaCove NF";
    #     size = "16px";
    #   };
    # };
  };
}
