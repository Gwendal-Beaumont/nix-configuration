{ config, pkgs, ... }:

{
  imports = [
    ./git
    ./hyprland
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "g23beaum";
  home.homeDirectory = "/home/g23beaum";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fastfetch

    # Archives
    zip
    unzip

    # Utils
    bat
    btop
    lf
    fd
    fzf
    libimobiledevice
    libsecret
    stow
    tree-sitter
    wl-clipboard
    zsh-autosuggestions
    zsh-syntax-highlighting

    # Network
    dnsutils
    nmap

    # Fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif

    # Productivity
    webex
    libreoffice-fresh
    texliveFull
    drawio

    # Misc
    which
    tree
    pciutils
    lazygit
    gnomeExtensions.appindicator

    # Languages
    python314
    pyenv
    jdk24
    nodejs-slim_24
    lua
    luajitPackages.luarocks
    go
    rustup
    ruby
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.firefox.enable = true;
  programs.eclipse.enable = true;
  programs.element-desktop.enable = true;

  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font Mono";
      size = 12.0;
    };

    themeFile = "Japanesque";
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = false;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      pyright
      ripgrep
      typescript-language-server
      yaml-language-server
      markdownlint-cli
    ];
  };
}
