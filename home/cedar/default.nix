{ config, pkgs, username, ... }:

{
  imports = [
    ../common

    ./git
    ./kitty
    ./neovim
  ];

  home = {
    username = "${username}";

    packages = with pkgs; [
      cairo
      cocoapods
      pinentry_mac
      lazygit
      yt-dlp
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
