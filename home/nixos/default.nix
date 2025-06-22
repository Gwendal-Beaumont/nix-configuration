{ config, pkgs, ... }:

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

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "g23beaum";
  home.homeDirectory = "/home/g23beaum";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Utils
    libimobiledevice
    libsecret
    usbutils
    wl-clipboard

    # Network
    dnsutils
    nmap

    # Productivity
    libreoffice-fresh
    drawio
    slack

    # Misc
    which
    pciutils
    gnomeExtensions.appindicator
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
