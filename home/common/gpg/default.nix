{ inputs, config, lib, pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.gpg = {
    enable = true;
  };
}
