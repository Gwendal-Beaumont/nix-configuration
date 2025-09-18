{ inputs, config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;

    profiles = {
      "default" = {
        enableUpdateCheck = true;
        enableExtensionUpdateCheck = true;

        extensions = with pkgs.vscode-extensions; [
          ms-azuretools.vscode-docker
        ];

        userSettings = {
          "files.autoSave" = "off";
        };
      };
    };
  };
}
