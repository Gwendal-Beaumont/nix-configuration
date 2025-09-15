{ config, pkgs, hostname, username, nixosModules, ... }:

{
  imports = [
    ./hardware-configuration.nix

    # "${nixosModules}/docker"
    "${nixosModules}/gnome"
    # "${nixosModules}/hyprland"
    "${nixosModules}/printing"
    # "${nixosModules}/qemu"
    # "${nixosModules}/wireshark"
  ];

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi = {
      canTouchEfiVariables = true;
    };
  };

  boot.initrd.luks.devices."luks-8f74c7fd-732f-43c7-ba42-380c3188d00c".device = "/dev/disk/by-uuid/8f74c7fd-732f-43c7-ba42-380c3188d00c";

  # Networking
  networking = {
    hostName = "${hostname}";
    networkmanager = {
      enable = true;
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "fr_FR.UTF-8";
      LC_IDENTIFICATION = "fr_FR.UTF-8";
      LC_MEASUREMENT = "fr_FR.UTF-8";
      LC_MONETARY = "fr_FR.UTF-8";
      LC_NAME = "fr_FR.UTF-8";
      LC_NUMERIC = "fr_FR.UTF-8";
      LC_PAPER = "fr_FR.UTF-8";
      LC_TELEPHONE = "fr_FR.UTF-8";
      LC_TIME = "fr_FR.UTF-8";
    };
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [
      xterm
    ];

    # Configure keymap in X11
    xkb = {
      layout = "fr";
      variant = "";
    };
  };

  # Power management for laptops
  services.thermald.enable = true;

  # Configure console keymap
  console.keyMap = "fr";

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # raopOpenFirewall = true;
    # extraConfig.pipewire = {
    #   "10-airplay" = {
    #     "context.modules" = [
    #       {
    #         name = "libpipewire-module-raop-discover";

    #         # increase the buffer size if you get dropouts/glitches
    #         args = {
    #           "raop.latency.ms" = 1500;
    #         };
    #       }
    #     ];
    #   };
    # };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Garbage collection
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
    settings.auto-optimise-store = true;
  };

  # User account. Don't forget to set a password with ‘passwd’.
  users.users.${username} = {
    isNormalUser = true;
    description = "Gwendal";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      thunderbird
    ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
    git
    vim
  ];

  # Env
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Programs
  programs.zsh.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.pcscd.enable = true;

  # Deactivate documentation
  documentation.nixos.enable = false;

  system.stateVersion = "25.05";
}
