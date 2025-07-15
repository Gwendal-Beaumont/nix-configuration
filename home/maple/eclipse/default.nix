{ inputs, config, lib, pkgs, ... }:

{
  programs.eclipse = {
    enable = true;

    package = pkgs.eclipses.eclipse-modeling;
  };
}
