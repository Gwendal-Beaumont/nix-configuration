{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "systemctl --user start hyprpolkitagent"
      "nm-applet"
      "hyprpanel"

      # Launch common apps
      "discord"
      "slack"
      "signal-desktop"
      "element-desktop --password-store='gnome-libsecret'"
    ];
  };
}
