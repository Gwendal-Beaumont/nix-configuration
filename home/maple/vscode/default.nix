{ inputs, config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    profiles = {
      "default" = {
        enableUpdateCheck = true;
        enableExtensionUpdateCheck = true;

        extensions = with pkgs.vscode-extensions; [
          vscjava.vscode-java-pack
        ];

        userSettings = {
          "files.autoSave" = "off";
        };
      };
    };
  };
}
