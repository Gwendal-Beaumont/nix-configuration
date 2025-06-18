{ inputs, config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      pyright
      ripgrep
      typescript-language-server
      yaml-language-server
      markdownlint-cli
    ];
  };
}
