{ inputs, config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = pkgs.emptyDirectory;
  };
}
