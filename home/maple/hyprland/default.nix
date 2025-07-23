{ inputs, config, lib, pkgs, ... }:

with lib; {
  imports = [
    # Hyprland config
    ./conf

    # Hyprpanel
    ./hyprpanel.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland = {
      enable = true;
    };
  };
}
