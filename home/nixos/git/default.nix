{ inputs, config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Gwendal Beaumont";
    userEmail = "gwendal.beaumont@imt-atlantique.fr";

    signing = {
      format = "openpgp";
      key = "DBF0167B74C46CA84C0D258851F454CFBA3AEA40";
      signByDefault = true;
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };

      credential = {
        helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
      };
    };
  };
}
