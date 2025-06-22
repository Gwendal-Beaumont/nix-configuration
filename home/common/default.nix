{ config, pkgs, ... }:

{
  imports = [
    # ./eclipse
    # ./element-desktop
    # ./firefox
    # ./git
    # ./gpg
    # ./hyprland
    # ./kitty
    ./neovim
    ./shell
    # ./starship
  ];

#   # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
#     # Archives
#     zip
#     unzip
#
#     # Utils
#     bat
#     btop
    lf
#     fastfetch
#     fd
#     fzf
#     libimobiledevice
#     libsecret
#     stow
#     tree-sitter
#     usbutils
#     wl-clipboard
#     zsh-autosuggestions
#     zsh-syntax-highlighting
#
#     # Network
#     dnsutils
#     nmap
#
#     # Productivity
#     libreoffice-fresh
#     texliveFull
#     drawio
#     slack
#
#     # Misc
#     which
#     tree
#     pciutils
#     lazygit
#     gnomeExtensions.appindicator
  ];
}
