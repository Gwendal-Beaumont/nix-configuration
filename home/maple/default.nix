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
      # Utils
      libgcc
      libsecret
      wl-clipboard

      # Productivity
      drawio
      zotero

      # Misc
      noto-fonts-cjk-sans

      # Emacs
      libtool
      nixfmt
      (aspellWithDicts (dicts: with dicts; [ en en-computers en-science fr ]))
    ];

    sessionPath = [
      "$HOME/.emacs.d/bin"
    ];

    stateVersion = "25.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
