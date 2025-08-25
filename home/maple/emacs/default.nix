{ inputs, config, lib, pkgs, ... }:

{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: [ epkgs.markdown-mode ];
  };
}
