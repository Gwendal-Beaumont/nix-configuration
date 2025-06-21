{ inputs, config, lib, pkgs, ... }:

{
  programs.gpg = {
    enable = true;
  };
}
