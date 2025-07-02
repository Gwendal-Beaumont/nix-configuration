{ config, pkgs, username, ... }:

{
  imports = [
    ../common

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
      pinentry
      usbutils
      wl-clipboard

      # Network
      dnsutils
      nmap

      # Productivity
      drawio
      libreoffice-fresh
      nextcloud-client
      zotero

      # Communication
      discord
      signal-desktop-bin
      slack
      zoom-us

      # Misc
      pciutils
      gnomeExtensions.appindicator
    ];

    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
