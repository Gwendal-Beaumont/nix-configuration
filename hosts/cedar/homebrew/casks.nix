{ inputs, config, lib, pkgs, ... }:

{
  homebrew.casks = [
    # Dev
    # "android-studio"
    "eclipse-ide"
    "visual-studio-code"

    # Communications
    "discord"
    "element"
    "signal"
    "slack"
    "thunderbird"
    "whatsapp"
    "webex"

    # Utils
    "drawio"
    "firefox"
    "kitty"
    "libreoffice"
    "logi-options+"
    "openvpn-connect"
    "orbstack"
    "protonvpn"
    "raycast"
    "vlc"
    "zotero"
  ];
}
