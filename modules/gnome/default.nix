{ lib, pkgs, ... }:

{
  imports = [
  ];

  options = {
  };

  config = {
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = with pkgs; [
      decibels
      epiphany
      geary
      gnome-text-editor
      gnome-console
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-tour
      gnome-connections
      totem
      yelp
    ]
  };
}
