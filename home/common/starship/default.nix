{ inputs, config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;

    settings = {
      add_newline = false;
    };
  };
}
