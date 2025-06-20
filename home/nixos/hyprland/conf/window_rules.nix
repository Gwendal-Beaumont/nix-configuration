{ config, ... }:

{
  wayland.windowManager.hyprland.settings = {
    # https://wiki.hyprland.org/Configuring/Window-Rules/
    windowrule = [
      "float,initialClass:^thunderbird$"
      "center,initialClass:^thunderbird$"

      # Ignore maximize requests from apps. You'll probably like this.
      "suppressevent maximize, class:.*"

      # Fix some dragging issues with XWayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];
  };
}
