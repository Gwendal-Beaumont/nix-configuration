{ pkgs, ... }:

{
  imports = [
    ./brews.nix
    ./casks.nix
    ./masApps.nix
  ];

  # Homebrew
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
  };
}
