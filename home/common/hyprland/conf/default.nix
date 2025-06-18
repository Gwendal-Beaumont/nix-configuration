{ inputs, config, lib, pkgs, ... }:
{
  imports = [
    ./monitors.nix
    ./programs.nix
    ./autostart.nix
    ./cursor.nix
    ./variables
    ./input.nix
    ./keybindings.nix
    ./workspace_rules.nix
    ./window_rules.nix
    ./master_layout.nix
    ./dwindle_layout.nix
  ];
}
