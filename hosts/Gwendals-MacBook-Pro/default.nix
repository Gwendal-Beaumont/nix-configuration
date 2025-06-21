{ pkgs, username, ... }:
{
  nix = {
    settings = {
      experimental-features = "nix-command flakes";
    };
    optimise.automatic = true;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  users.users.${username} = {
    name = "${username}";
    home = "/Users/${username}";
  };

  # Enable TouchID with sudo
  security.pam.services.sudo_local = {
    touchIdAuth = true;
    watchIdAuth = true;
  };

  system = {
    defaults = {
      CustomUserPreferences = {
        NSGlobalDomain."com.apple.mouse.linear" = true;
      };
      NSGlobalDomain = {
        AppleInterfaceStyleSwitchesAutomatically = true;
        AppleShowAllExtensions = true;
        NSAutomaticWindowAnimationsEnabled = false;
      };
      dock = {
        autohide = true;
        expose-animation-duration = 0.15;
        show-recents = false;
        showhidden = true;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };
      screencapture = {
        type = "png";
        disable-shadow = true;
      };
    };
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vim
    fastfetch
    bat
    biber
    cairo
    cocoapods
    coreutils
    curl
    fd
    fzf
    git
    gnupg
    go
    gopls
    lazygit
    lua
    neovim
    jdk
    php
    ripgrep
    ruby
    rustup
    starship
    stow
    texliveFull
    tree
    tree-sitter
    wget
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];

  # Homebrew
  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";

    taps = [];
    brews = [];
    casks = [
      "android-studio"
      "appcleaner"
      "discord"
      "drawio"
      "eclipse-ide"
      "firefox"
      "gimp"
      "google-chrome"
      "kitty"
      "libreoffice"
      "logi-options+"
      "openvpn-connect"
      "protonvpn"
      "signal"
      "slack"
      "thunderbird"
      "visual-paradigm-ce"
      "visual-studio-code"
      "vlc"
      "webex"
      "whatsapp"
      "wireshark"
      "zoom"
      "zotero"
    ];
  };
  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
  system.primaryUser = "${username}";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
