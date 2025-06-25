{ config, pkgs, username, ... }:

{
  imports = [
    ../common

    ./eclipse
    ./element-desktop
    ./firefox
    ./git
    ./gpg
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
      tcpdump
      usbutils
      wl-clipboard

      # Network
      dnsutils
      nmap

      # Productivity
      libreoffice-fresh
      discord
      drawio
      signal-desktop-bin
      slack
      zotero

      # Misc
      which
      pciutils
      gnomeExtensions.appindicator
    ];

    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
