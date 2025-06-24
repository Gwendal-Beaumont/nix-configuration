{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "systemctl --user start hyprpolkitagent"
      "nm-applet"
      "hyprpanel"

      # Launch common apps
      "flatpak run com.discordapp.Discord"
      "flatpak run com.slack.Slack"
      "flatpak run org.signal.Signal"
      "element-desktop --password-store='gnome-libsecret'"
    ];
  };
}
