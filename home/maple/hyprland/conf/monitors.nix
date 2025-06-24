{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # See https://wiki.hyprland.org/Configuring/Monitors/
    monitor = [
      "desc:AU Optronics 0x4F8A, 1920x1080@60, 0x0, 1"
      "desc:HP Inc. HP E27q G5 CNC42530PR, 2560x1440@75, -2560x0, 1"
      "desc:Dell Inc. DELL P2722H 2677DJ3, 1920x1080@70, -1920x0, 1"
      "desc:Dell Inc. DELL U2724DE 7W4FCP3, 2560x1440@120, -2560x0, 1"

      # Monitor in videoconference room, uncomment if necessaery
      "HDMI-A-1, 3840x2160@60, 1920x0, 2, mirror, desc:AU Optronics 0x4F8A"

      ",preferred,auto,auto"
    ];
  };
}
