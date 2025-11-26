{ pkgs, ... }:

{
  config = {
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    # Make sure dev-tools and games aren't installed by default
    services.gnome = {
      core-developer-tools.enable = false;
      games.enable = false;
    };

    environment.gnome.excludePackages = with pkgs; [
      decibels
      epiphany
      geary
      gnome-characters
      gnome-connections
      gnome-console
      gnome-contacts
      gnome-font-viewer
      gnome-maps
      gnome-music
      gnome-text-editor
      gnome-tour
      gnome-user-docs
      gnome-weather
      simple-scan
      totem
      yelp
    ];
  };
}
