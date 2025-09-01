{ inputs, config, lib, pkgs, ... }:

{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: [
      epkgs.markdown-mode
      epkgs.pinentry
      epkgs.tramp
    ];
  };
}
