{ inputs, config, lib, pkgs, ... }:

{
  homebrew.brews = [
    {
      name = "emacs-mac";
      args = [
        "with-modules"
      ];
    }
  ];
}
