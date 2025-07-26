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
    ./tmux
  ];

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Archives
    zip
    unzip

    # Utils
    bat
    btop
    curl
    fastfetch
    fd
    fzf
    ripgrep
    stow
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
  ];
}
