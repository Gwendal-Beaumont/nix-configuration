{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # https://wiki.hyprland.org/Configuring/Variables/#decoration
    decoration = {
      rounding = 5;
      rounding_power = 2;

      # Change transparency of focused and unfocused windows
      active_opacity = 1.0;

      shadow = {
        enabled = false;
      };

      # https://wiki.hyprland.org/Configuring/Variables/#blur
      blur = {
        enabled = true;
        size = 20;
        passes = 2;
        contrast = 0.8916;
        brightness = 1.0;
        vibrancy = 1.0;
        vibrancy_darkness = 0.5;
      };
    };
  };
}
