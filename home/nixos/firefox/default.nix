{ inputs, config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    languagePacks = [
      "en-GB"
      "fr"
    ];
  };
}
