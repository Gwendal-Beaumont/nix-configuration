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

      # cert
      mkcert

      # Flutter programming
      flutter
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
