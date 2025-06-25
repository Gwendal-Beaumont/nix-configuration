{ config, pkgs, ... }:

{
  imports = [
    ./git
    ./gpg
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
    pinentry
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
