{ inputs, config, lib, pkgs, ... }:

{
  programs.emacs = {
    enable = true;

    extraPackages = epkgs: [
      epkgs.markdown-mode
      epkgs.pinentry
    ];
  };

  # Add these packages for emacs
  home.packages = with pkgs; [
    libtool
    nerd-fonts.symbols-only
    nixfmt
    shellcheck

    # Dictionnaries
    (aspellWithDicts (dicts: with dicts; [ en en-computers en-science fr ]))
  ];
}
