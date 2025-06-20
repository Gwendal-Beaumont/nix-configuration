{ config, pkgs, ... }:

{
  home.username = "gwendalbeaumont";

  home.packages = with pkgs; [
    htop
    fortune
  ];

  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.git = {
    enable = true;
    userName = "Gwendal Beaumont";
    userEmail = "gwendal.beaumont@gmail.com";
  };
}
