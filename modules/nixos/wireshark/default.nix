{ pkgs, ... }:

{
  config = {
    programs.wireshark = {
      enable = true;
      usbmon.enable = true;
    };
  };
}
