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

    shellAliases = {
      e = "nvim";
      o = "xdg-open";
      open = "xdg-open";
      mk = "(){ mkdir -p $1 && cd $1 }";
      phd = "cd $HOME/Documents/twindevops";
      youtube = "yt-dlp -S res,ext:mp4:m4a --recode mp4";

      ls = "ls --color";
      l = "ls";
      ll = "ls -l";
      lla = "ls -la";

      nrs = "sudo nixos-rebuild switch";
      drs = "sudo darwin-rebuild switch";
      nfu = "nix flake update --flake ~/nix-configuration/";

      lg = "lazygit";
      g = "git";
      ga = "git add";
      gaa = "git add -A";
      gcm = "git commit -m";
      gs = "git status";
      gss = "git status -s";
      gb = "git branch";
      gc = "git checkout";
      gcb = "git checkout -b";
      gp = "git push";
      gf = "git fetch";
      gP = "git pull";
    };
  };
}
