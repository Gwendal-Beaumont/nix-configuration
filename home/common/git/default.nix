{ inputs, config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Gwendal Beaumont";

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
