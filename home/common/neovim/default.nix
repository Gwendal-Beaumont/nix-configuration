{ inputs, config, lib, pkgs, ... }:

{
  programs.neovim = {
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    withNodeJs = true;
    withRuby = true;

    extraPackages = with pkgs; [
      markdownlint-cli
      go
    ];
  };
}
