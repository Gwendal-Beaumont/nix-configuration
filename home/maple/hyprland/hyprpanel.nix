{ inputs; config, lib, pkgs, ... }:

{
  programs.hyprpanel = {
    enable = true;

    settings = {
      bar = {
        autoHide = "fullscreen";
        clock.format = "%a%e %b %H:%M";
        launcher.autoDetectIcon = true;
        layouts = {
          "*" = {
            left = [
              "dashboard"
              "updates"
              "workspaces"
            ];
            middle = [
              "media"
            ];
            right = [
              "volume"
              "battery"
              "bluetooth"
              "network"
              "systray"
              "clock"
              "notifications"
            ];
          };
        };
        workspaces = {
          show_icons = false;
          show_numbered = true;
          workspaceMask = false;
          numbered_active_indicator = "underline";
        };

      theme = {
        bar = {
          floating = false;
          location = "top";
          buttons = {
            enableBorders = false;
          };

          menus = {
            monochrome = true;
            card_radius = "0.4em";
            popover.text = "#ffffff";
            listitems.active = "#ffffff";
            icons.active = "#ff8000";
            switch.enabled = "#ff8000";
            check_radio_button.active = "#ff8000";
            buttons.default = "#ff8000";
            iconbuttons.active = "#ff8000";
            progressbar.foreground = "#ff8000";
            slider.primary = "#ff8000";
            dropdownmenu.text = "#ffffff";
            tooltip.text = "#ffffff";
            iconbuttons.passive = "#ffffff";
            cards = "#1e1e2e";
            background = "#000000";
          };
        };

        font = {
          name = "JetBrainsMono Nerd Font";
          label = "JetBrainsMono Nerd Font";
          size = "0.9rem";
        };

        osd = {
          scaling = 90;
        };
      };

      menus = {
        clock = {
          time = {
            military = true;
            hideSeconds = false;
          };
          weather = {
            location = "Los Angeles";
            unit = "metric";
          };
        };
        power.lowBatteryNotification = true;
        transition = "crossfade";
      };

      bar.volume.label = true;
      menus.clock.weather.key = "";
      notifications.monitor = 0;
      bar.network.label = true;
      bar.network.showWifiInfo = true;
      bar.battery.label = true;
      bar.battery.hideLabelWhenFull = false;
      bar.media.show_active_only = true;
      bar.notifications.show_total = true;
      bar.notifications.hideCountWhenZero = true;
      theme.bar.border.location = "none";
      theme.bar.outer_spacing = "0.4em";
      menus.media.hideAuthor = false;
      menus.media.displayTimeTooltip = true;
      bar.media.show_label = true;
      bar.media.truncation_size = 50;
      theme.bar.transparent = false;
      theme.bar.buttons.style = "default";
      theme.bar.buttons.monochrome = true;
      theme.bar.menus.text = "#f6f5f4";
      theme.bar.menus.label = "#ffffff";
      theme.bar.buttons.text = "#ffffff";
      theme.bar.buttons.icon = "#ffffff";
      theme.bar.buttons.workspaces.active = "#ffffff";
      theme.bar.buttons.workspaces.numbered_active_underline_color = "#ffffff";
      theme.bar.buttons.workspaces.occupied = "#ffffff";
      theme.bar.background = "#000000";
      wallpaper.enable = false;
      menus.power.showLabel = true;
      theme.bar.buttons.modules.netstat.enableBorder = false;
      bar.customModules.netstat.dynamicIcon = true;
      bar.customModules.netstat.rateUnit = "auto";
      bar.customModules.netstat.pollingInterval = 5000;
      bar.customModules.netstat.leftClick = "menu:network";
      bar.customModules.updates.autoHide = true;
      bar.customModules.weather.unit = "metric";
      tear = false;
      bar.workspaces.showWsIcons = false;
      bar.workspaces.showApplicationIcons = false;
      bar.volume.rightClick = "wpctl set-mute @DEFAULT_SINK@ toggle";
      bar.bluetooth.label = false;
      bar.clock.showIcon = true;
      bar.clock.showTime = true;
      notifications.position = "top right";
      notifications.showActionsOnHover = true;
      theme.osd.orientation = "horizontal";
      theme.osd.location = "bottom";
      theme.osd.margins = "7px 7px 200px 7px";
      theme.osd.muted_zero = false;
      menus.volume.raiseMaximumVolume = false;
      menus.clock.weather.enabled = false;
      theme.bar.menus.menu.dashboard.profile.size = "8.5em";
      menus.dashboard.powermenu.confirmation = true;
      menus.dashboard.controls.enabled = false;
      menus.dashboard.stats.enabled = true;
      menus.dashboard.directories.enabled = false;
      menus.dashboard.shortcuts.left.shortcut1.command = "firefox";
      menus.dashboard.shortcuts.left.shortcut1.icon = "󰈹";
      menus.dashboard.shortcuts.left.shortcut4.command = "rofi -show drun -show-icons";
      menus.dashboard.shortcuts.left.shortcut2.icon = "󰝚";
      menus.dashboard.shortcuts.left.shortcut2.command = "firefox --new-tab https://music.apple.com/fr/";
      menus.dashboard.shortcuts.left.shortcut2.tooltip = "Apple Music";
      theme.font.weight = 600;
      menus.media.displayTime = true;
      menus.dashboard.shortcuts.left.shortcut1.tooltip = "Mozilla Firefox";
      bar.customModules.netstat.networkInterface = "enp0s13f0u2u4";
      theme.bar.buttons.background = "#1c1c1c";
      bar.customModules.storage.paths = [
        "/"
      ];
    };
  };
}
