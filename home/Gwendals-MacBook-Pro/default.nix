{ config, pkgs, ... }:

{
  imports = [
    ../common

    ./git
  ];

  home.username = "gwendalbeaumont";

  home.packages = with pkgs; [
    cairo
    cocoapods
    coreutils
    nerd-fonts.jetbrains-mono
  ];

  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
