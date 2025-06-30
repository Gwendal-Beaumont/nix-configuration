{ config, pkgs, username, ... }:

{
  imports = [
    ../common

    ./alacritty
    ./eclipse
    ./element-desktop
    ./firefox
    ./git
    ./hyprland
    ./kitty
    ./vscode
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      # Utils
      libimobiledevice
      libsecret
      mkcert
      pinentry
      usbutils
      wl-clipboard

      # Network
      dnsutils
      nmap

      # Productivity
      drawio
      libreoffice-fresh
      pympress
      zotero

      # Communication
      discord
      signal-desktop-bin
      slack
      webex
      weechat
      zoom-us

      # Misc
      markdownlint-cli
      pciutils
      gnomeExtensions.appindicator
    ];

    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
