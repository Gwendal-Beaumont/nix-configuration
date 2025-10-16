{ pkgs, username, ... }:

{
  config = {
    programs.virt-manager.enable = true;
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };

      spiceUSBRedirection.enable = true;
    };

    users.users."${username}" = {
      extraGroups = [ "libvirtd" ];
    };
  };
}
