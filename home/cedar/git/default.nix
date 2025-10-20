{ inputs, config, lib, pkgs, ... }:

{
  programs.git = {
    settings = {
      user.email = "gwendal.beaumont@gmail.com";

      "includeIf \"gitdir:~/Documents/twindevops/\"" = {
        path = "~/.config/git/imt/.gitconfig";
      };
    };

    signing = {
      key = "847D7D2DB3796CB8789644E373692F251579041D";
    };
  };
}
