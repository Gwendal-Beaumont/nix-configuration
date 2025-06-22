{ inputs, config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Gwendal Beaumont";
    userEmail = "gwendal.beaumont@gmail.com";

    signing = {
      format = "openpgp";
      key = "847D7D2DB3796CB8789644E373692F251579041D";
      signByDefault = true;
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };

      "includeIf \"gitdir:~/Documents/twindevops/\"" = {
        path = "~/.config/git/imt/.gitconfig";
      };
    };
  };
}
