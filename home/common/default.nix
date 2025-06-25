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
    lf
    fastfetch
    fd
    fzf
    pinentry
    ripgrep
    stow
    tree-sitter

    # Productivity
    texliveFull

    # Misc
    lazygit
  ];
}
