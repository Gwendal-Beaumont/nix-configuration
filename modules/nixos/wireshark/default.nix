{ pkgs, ... }:

{
  config = {
    programs.wireshark = {
      enable = true;
      usbmon.enable = true;
    };

    users.users."${username}" = {
      extraGroups = [ "wireshark" ];
    };
  };
}
