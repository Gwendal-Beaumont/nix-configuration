{ inputs, config, lib, pkgs, ... }:

{
  homebrew.casks = [
    # Dev
    "eclipse-ide"
    "visual-studio-code"

    # Communications
    "element"
    "signal"
    "slack"
    "thunderbird"
    "whatsapp"
    "webex"

    # Utils
    "drawio"
    "firefox"
    "kdrive"
    "kitty"
    "libreoffice"
    "logi-options+"
    "openvpn-connect"
    "orbstack"
    "protonvpn"
    "qobuz"
    "vlc"
    "zotero"
  ];
}
