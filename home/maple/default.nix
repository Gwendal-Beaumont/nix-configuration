{ config, pkgs, username, ... }:

{
  imports = [
    ../common

    ./eclipse
    ./element-desktop
    ./emacs
    ./firefox
    ./git
    # ./hyprland
    ./kitty
    # ./rofi
    # ./vscode
    # ./wlogout
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      # Utils
      gcc
      libsecret
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
      vlc

      # Emacs
      nixfmt
      python3Full
      isort
      pipenv
    ];

    sessionPath = [
      "$HOME/.emacs.d/bin/doom"
    ];

    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
