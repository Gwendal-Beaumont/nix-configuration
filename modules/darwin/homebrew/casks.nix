{ inputs, config, lib, pkgs, ... }:

{
  homebrew.casks = [
    # Dev
    "eclipse-ide"
    "visual-studio-code"

    # Communications
    "signal"
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
    "qobuz"
    "vlc"
    "zotero"
  ];
}
