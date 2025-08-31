{ pkgs, ... }:

{
  imports = [
    ./brews.nix
    ./casks.nix
    ./masApps.nix
    ./taps.nix
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
