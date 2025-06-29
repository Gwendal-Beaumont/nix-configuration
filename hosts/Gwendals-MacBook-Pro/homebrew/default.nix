{ pkgs, ... }:

{
  # Homebrew
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };

    taps = [];
    brews = [];
    casks = [
      "android-studio"
      "appcleaner"
      "discord"
      "drawio"
      "eclipse-ide"
      "element"
      "firefox"
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
      "zoom"
      "zotero"
    ];
  };
}
