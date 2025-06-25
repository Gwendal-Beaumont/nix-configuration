{ inputs, config, lib, pkgs, ... }:

with lib; {
  imports = [
    # Hyprland config
    ./conf
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };
}
