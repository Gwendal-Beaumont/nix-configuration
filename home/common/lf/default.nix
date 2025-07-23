{ inputs, config, lib, pkgs, ... }:

{
  programs.lf = {
    enable = true;

    commands = {
      rename = "%[ -e $1 ] && printf "file exists" || mv $f $1";
      trash = "%trash-put -- $fx";
      zip = "${{ set -f mkdir $1 cp -r $fx $1 zip -r $1.zip $1 rm -rf $1 }}";
    };

    keybindings = {
      "`" = "!true";
      "n" = "push %mkdir<space>";
      "." = "set hidden!";
      "d" = "trash";
      "r" = "push :rename<space>";
    };

    settings = {
      ifs = "'\n'";
      scrolloff = 10;
      shell = "sh";
      shellopts = "'-eu'";
    };
  };
}
