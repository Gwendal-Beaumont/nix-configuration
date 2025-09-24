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
      networkmanager-openvpn

      # Productivity
      drawio
      libreoffice-fresh
      zotero

      # Misc
      gnomeExtensions.appindicator
      gnome-tweaks
      noto-fonts-cjk-sans

      # Emacs
      cmake # for vTerm
      libtool
      nixfmt
      python3Minimal
      isort
      pipenv
    ];

    sessionPath = [
      "$HOME/.emacs.d/bin"
    ];

    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
