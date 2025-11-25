{ config, pkgs, username, ... }:

{
  imports = [
    ../common

    ./eclipse
    ./emacs
    ./firefox
    ./git
    # ./hyprland
    ./kitty
    # ./rofi
    # ./wlogout
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
      # Productivity
      drawio
      zotero

      # Misc
      noto-fonts-cjk-sans

      # Utils
      libgcc
      libsecret
      wl-clipboard
    ];

    sessionPath = [
      "$HOME/.emacs.d/bin"
    ];

    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
