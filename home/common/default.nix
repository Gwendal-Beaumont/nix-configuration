{ config, pkgs, ... }:

{
  imports = [
    ./git
    ./gpg
    ./kitty
    ./lf
    # ./neovim
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
    ripgrep
    tree-sitter
    wget
    yt-dlp

    # lf
    lf
    trash-cli

    # Productivity
    texliveFull
    hunspell
    hunspellDicts.en_US
    hunspellDicts.fr-any

    # Misc
    lazygit
    shellcheck
    nerd-fonts.symbols-only
  ];
}
