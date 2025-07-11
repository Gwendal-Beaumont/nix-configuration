{ inputs, config, lib, pkgs, ... }:

{
  programs.alacritty = {
    theme = "dark_plus";

    settings = {
      colors = {
        # Colors (Japanesque)
        bright = {
          black = "#595b59";
          blue = "#135979";
          cyan = "#76bbca";
          green = "#767f2c";
          magenta = "#604291";
          red = "#d18fa6";
          white = "#b2b5ae";
          yellow = "#78592f";
        };
        cursor = {
          cursor = "#edcf4f";
          text = "#343935";
        };
        normal = {
          black = "#343935";
          blue = "#4c9ad4";
          cyan = "#389aad";
          green = "#7bb75b";
          magenta = "#a57fc4";
          red = "#cf3f61";
          white = "#fafaf6";
          yellow = "#e9b32a";
        };
        primary = {
          background = "#1e1e1e";
          foreground = "#f7f6ec";
        };
        selection = {
          background = "#175877";
          text = "#f7f6ec";
        };
      };

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
