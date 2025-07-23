{ inputs, config, lib, pkgs, ... }:

{
  programs.lf = {
    enable = true;

    commands = {
      rename = "%[ -e $1 ] && printf 'file exists' || mv $f $1";
      trash = "%trash-put -- $fx";
      zip = "$\{\{\n\tset -f\n\tmkdir $1\n\tcp -r $fx $1\n\tzip -r $1.zip $1\n\trm -rf $1\n\}\}";
    };

    keybindings = {
      "." = "set hidden!";
      "`" = "!true";
      "d" = "trash";
      "n" = "push %mkdir<space>";
      "r" = "push :rename<space>";
    };

    settings = {
      ifs = "\\n";
      scrolloff = 10;
      shell = "sh";
      shellopts = "-eu";
    };
  };
}
