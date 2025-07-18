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
          ovmf = {
            enable = true;
            packages = [(pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd];
          };
        };
      };

      spiceUSBRedirection.enable = true;
    };

    users.users."${username}" = {
      extraGroups = [ "libvirtd" ];
    };
  };
}
