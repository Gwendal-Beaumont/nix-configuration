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
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      # Utils
      libimobiledevice
      libsecret
      pinentry
      usbutils
      wl-clipboard

      # Network
      dnsutils
      nmap

      # Productivity
      drawio
      libreoffice-fresh
      zotero

      # Communication
      discord
      signal-desktop-bin
      slack

      # Misc
      pciutils
      gnomeExtensions.appindicator
    ];

    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
