{ inputs, config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings.user.name = "Gwendal Beaumont";

    signing = {
      format = "openpgp";
      signByDefault = true;
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
