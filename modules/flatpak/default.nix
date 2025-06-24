{ lib, ... }: {

  # Auto-update flatpaks with nix
  services.flatpak.update.auto.enable = true;
  # Auto-remove unnececessary flatpaks
  services.flatpak.uninstallUnmanaged = true;

  # Flatpaks to install
  services.flatpak.packages = [
    "com.discordapp.Discord"
    "org.signal.Signal"
    "org.zotero.Zotero"
  ];
}
