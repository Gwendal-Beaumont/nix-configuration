{ inputs, config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
      size = 12.0;
    };

    themeFile = "Japanesque";
  };
}
