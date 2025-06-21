{ pkgs, ... }:
{
  users.users.gwendalbeaumont = {
    name = "gwendalbeaumont";
    home = "/Users/gwendalbeaumont";
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

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
  system.primaryUser = "gwendalbeaumont";

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
