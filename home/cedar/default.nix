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
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
