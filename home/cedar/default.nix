{ config, pkgs, username, ... }:

{
  imports = [
    ../common

    ./alacritty
    ./git
    ./kitty
  ];

  home = {
    username = "${username}";

    packages = with pkgs; [
      cairo
      cocoapods
      coreutils
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
