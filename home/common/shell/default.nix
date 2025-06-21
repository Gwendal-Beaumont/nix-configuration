{ inputs, config, lib, pkgs, ... }:
{
  home = {
    shellAliases = {
      e = "nvim";
      o = "xdg-open";
      open = "xdg-open";
      phd = "cd $HOME/Documents/twindevops";

      ls = "ls --color";
      l = "ls";
      ll = "ls -l";
      lla = "ls -la";

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

    shell.enableZshIntegration = true;
  };
}
