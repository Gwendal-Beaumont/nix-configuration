{ inputs, config, lib, pkgs, ... }:

{
  homebrew.casks = [
    # Dev
    #"emacs-mac"
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
