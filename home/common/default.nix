{ config, pkgs, ... }:

{
  imports = [
    ./git
    ./gpg
    ./kitty
    ./lf
    ./neovim
    ./shell
    ./starship
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Archives
    zip
    unzip

    # Utils
    bat
    btop
    coreutils
    curl
    fastfetch
    fd
    fzf
    gnumake
    lf
    ripgrep
    trash-cli
    tree-sitter
    wget

    # LaTeX
    texliveFull

    # Misc
    shellcheck
    nerd-fonts.symbols-only
  ];
}
