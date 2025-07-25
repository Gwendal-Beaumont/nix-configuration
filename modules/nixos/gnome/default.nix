{ pkgs, ... }:

{
  config = {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    environment.gnome.excludePackages = with pkgs; [
      decibels
      epiphany
      geary
      gnome-characters
      gnome-connections
      gnome-console
      gnome-contacts
      gnome-maps
      gnome-music
      gnome-text-editor
      gnome-tour
      gnome-weather
      totem
      yelp
    ];
  };
}
