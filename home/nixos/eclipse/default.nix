{ inputs, config, lib, pkgs, ... }:

{
  programs.eclipse = {
    enable = true;

    # plugins = [
    #   eclipse-sdk
    #   eclipse-modeling
    # ];
  };
}
