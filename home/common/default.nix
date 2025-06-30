{ config, pkgs, ... }:

{
  imports = [
    ./git
    ./gpg
    ./kitty
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
    fastfetch
    fd
    fzf
    ripgrep
    stow
    tree-sitter

    # lf
    lf
    trash-cli

    # Productivity
    texliveFull

    # Misc
    lazygit
  ];
}
