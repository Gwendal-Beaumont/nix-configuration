{ config, pkgs, username, ... }:

{
  imports = [
    ../common

    ./git
    ./kitty
  ];

  home = {
    username = "${username}";

    packages = with pkgs; [
      cairo
      cocoapods
      coreutils
      nerd-fonts.jetbrains-mono
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
