{ inputs, config, lib, pkgs, ... }:

{
  homebrew.casks = [
    # Dev
    "android-studio"
    "eclipse-ide"
    "visual-studio-code"

    # Communications
    "signal"
    "thunderbird"
    "whatsapp"
    "webex"

    # Utils
    "darktable"
    "drawio"
    "firefox"
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
