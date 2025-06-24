{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # https://wiki.hyprland.org/Configuring/Variables/#animations
    animations = {
      enabled = false;
    };
  };
}
