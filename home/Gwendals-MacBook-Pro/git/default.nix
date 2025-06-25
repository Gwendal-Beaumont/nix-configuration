{ inputs, config, lib, pkgs, ... }:

{
  programs.git = {
    userEmail = "gwendal.beaumont@gmail.com";

    signing = {
      key = "847D7D2DB3796CB8789644E373692F251579041D";
    };

    extraConfig = {
      "includeIf \"gitdir:~/Documents/twindevops/\"" = {
        path = "~/.config/git/imt/.gitconfig";
      };
    };
  };
}
