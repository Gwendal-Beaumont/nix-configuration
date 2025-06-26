{ inputs, config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    theme = "dark_plus";

    settings = {
      font = {
        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Regular";
        };
        size = 12.0;
      };
    };
  };
}
