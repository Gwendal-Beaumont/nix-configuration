{ config, pkgs, ... }:

{
  imports = [
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
    ripgrep
    stow
    tree-sitter
    zsh-autosuggestions
    zsh-syntax-highlighting

    # Productivity
    texliveFull

    # Misc
    tree
    lazygit
  ];
}
