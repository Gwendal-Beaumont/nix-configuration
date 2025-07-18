{ config, pkgs, username, ... }:

{
  imports = [
    ../common

    ./eclipse
    ./element-desktop
    ./firefox
    ./git
    # ./hyprland
    ./kitty
    # ./vscode
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      # Utils
      gcc
      libimobiledevice
      libsecret
      pinentry
      wl-clipboard

      # Productivity
      drawio
      # libreoffice-fresh
      nextcloud-client
      zotero

      # Communication
      discord
      signal-desktop-bin

      # Misc
      gnomeExtensions.appindicator
      gnome-tweaks
    ];

    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
