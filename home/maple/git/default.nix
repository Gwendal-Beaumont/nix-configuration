{ inputs, config, lib, pkgs, ... }:

{
  programs.git = {
    settings = {
      user.email = "gwendal.beaumont@imt-atlantique.fr";

      credential = {
        helper = "${
            pkgs.git.override { withLibsecret = true; }
          }/bin/git-credential-libsecret";
      };
    };


    signing = {
      key = "DBF0167B74C46CA84C0D258851F454CFBA3AEA40";
    };
  };
}
