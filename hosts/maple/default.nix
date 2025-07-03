{ config, pkgs, hostname, username, nixosModules, ... }:

{
  imports = [
    ./hardware-configuration.nix

    "${nixosModules}/gnome"
    "${nixosModules}/printing"
    "${nixosModules}/qemu"
  ];

  # Bootloader.
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

    # Configure network proxy if necessary
    # proxy = {
    #   default = "http://user:password@proxy:port/";
    #   noProxy = "127.0.0.1,localhost,internal.domain";
    # };

    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
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
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };

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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Garabge collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  nix.settings.auto-optimise-store = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.g23beaum = {
    isNormalUser = true;
    description = "Gwendal";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" "wireshark" ];
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
    gnupg
    pinentry
    gcc

    # Utilities
    power-profiles-daemon
    wireshark
  ];

  # Env
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.zsh.enable = true;
  programs.gnupg.agent.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.pcscd.enable = true;

  # Docker
  virtualisation.docker.enable = true;
  virtualisation.podman.enable = true;

  # Wireshark
  programs.wireshark = {
    enable = true;
    usbmon.enable = true;
  };

  security.pki.certificates = [
    "./../../secrets/hosts/maple/rootCA.pem"
  ];

  networking.hosts = {
    "127.0.0.1" = [
      "example.local"
      "matrix.example.local"
      "auth.example.local"
      "element.example.local"
      "call.example.local"
      "livekit.example.local"
      "livekit-jwt.example.local"
    ];
  };

  system.stateVersion = "25.05";
}
