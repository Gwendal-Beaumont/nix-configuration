{ pkgs, ... }:

{
  imports = [
    ./casks.nix
    ./masApps.nix
  ];

  # Homebrew
  homebrew = {
    enable = true;

    greedyCasks = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
      extraFlags = [
        "--verbose"
      ];
      upgrade = true;
    };
  };
}
