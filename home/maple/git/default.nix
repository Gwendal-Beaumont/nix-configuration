{ inputs, config, lib, pkgs, ... }:

{
  programs.git = {
    userEmail = "gwendal.beaumont@imt-atlantique.fr";

    signing = {
      key = "DBF0167B74C46CA84C0D258851F454CFBA3AEA40";
    };

    extraConfig = {
      credential = {
        helper = "${
            pkgs.git.override { withLibsecret = true; }
          }/bin/git-credential-libsecret";
      };
    };
  };
}
