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
      # Misc
      cairo
      cocoapods
      pinentry_mac
      lazygit

      # Development
      flutter

      # Dictionnaries
      hunspell
      hunspellDicts.en_US
      hunspellDicts.fr-any
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
