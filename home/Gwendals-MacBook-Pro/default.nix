{ config, pkgs, username, ... }:

{
  imports = [
    ../common

    ./git
  ];

  home = {
    username = "${username}";

    packages = with pkgs; [
      cairo
      cocoapods
      coreutils
      nerd-fonts.jetbrains-mono
    ];

    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
