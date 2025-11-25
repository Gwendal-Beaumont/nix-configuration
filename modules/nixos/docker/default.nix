{ pkgs, username, ... }:

{
  config = {
    virtualisation.docker.enable = true;

    users.users."${username}" = {
      extraGroups = [ "docker" ];
    };
  };
}
