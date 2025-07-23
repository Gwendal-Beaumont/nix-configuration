{ inputs, config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    modes = [
      "drun"
      "filebrowser"
      "ssh"
    ];

    theme = "android_notification";
  };
}
