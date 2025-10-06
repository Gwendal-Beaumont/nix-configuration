{ inputs, config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
    '';
  };

  home.shellAliases = {
    e = "nvim";
    o = "xdg-open";
    open = "xdg-open";
    mk = "(){ mkdir -p $1 && cd $1 }";
    phd = "cd $HOME/Documents/twindevops";

    ls = "ls --color";
    l = "ls";
    ll = "ls -l";
    lla = "ls -la";

    nrs = "sudo nixos-rebuild switch";
    drs = "sudo darwin-rebuild switch";
    nfu = "nix flake update --flake ~/nix-configuration/";

    lg = "lazygit";
  };
}
