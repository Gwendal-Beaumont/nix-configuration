{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # https://wiki.hyprland.org/Configuring/Workspace-Rules/
    workspace = [
      "1, on-created-empty: firefox & thunderbird"
    ];
  };
}
