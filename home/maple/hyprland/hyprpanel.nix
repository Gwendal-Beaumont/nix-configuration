{ inputs, config, lib, pkgs, ... }:

{
  programs.hyprpanel = {
    enable = true;

    settings = {
      bar = {
        autoHide = "fullscreen";
        battery = {
          hideLabelWhenFull = false;
          label = true;
        };
        bluetooth.label = false;
        clock = {
          format = "%a%e %b %H =%M";
          showIcon = true;
          showTime = true;
        };
        customModules = {
          netstat = {
            dynamicIcon = true;
            leftClick = "menu =network";
            networkInterface = "enp0s13f0u2u4";
            pollingInterval = 5000;
            rateUnit = "auto";
          };
          storage.paths = [
            "/"
          ];
          updates = {
            autoHide = true;
            pollingInterval = 1440000;
          };
          weather.unit = "metric";
        };
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
        media = {
          show_active_only = true;
          show_label = true;
          truncation_size = 50;
        };
        network = {
          label = true;
          showWifiInfo = true;
        };
        notifications = {
          hideCountWhenZero = true;
          show_total = true;
        };
        volume ={
          label = true;
          rightClick = "wpctl set-mute @DEFAULT_SINK@ toggle";
        };
        workspaces = {
          numbered_active_indicator = "underline";
          showApplicationIcons = false;
          showWsIcons = false;
          show_icons = false;
          show_numbered = true;
          workspaceMask = false;
        };
      };

      menus = {
        clock = {
          time = {
            hideSeconds = false;
            military = true;
          };
          weather = {
            enabled = false;
          };
        };
        dashboard = {
          controls.enabled = false;
          directories.enabled = false;
          powermenu.confirmation = true;
          shortcuts.left = {
            shortcut1 = {
              command = "firefox";
              icon = "󰈹";
              tooltip = "Mozilla Firefox";
            };
            shortcut2 = {
              command = "firefox --new-tab https =//music.apple.com/fr/";
              icon = "󰝚";
              tooltip = "Apple Music";
            };
            shortcut4.command = "rofi -show drun -show-icons";
          };
          stats.enabled = true;
        };
        media = {
          displayTime = true;
          displayTimeTooltip = true;
          hideAuthor = false;
        };
        power = {
          lowBatteryNotification = true;
          showLabel = true;
        };
        transition = "crossfade";
        volume.raiseMaximumVolume = false;
      };
      notifications = {
        monitor = 0;
        position = "top right";
        showActionsOnHover = true;
      };
      tear = false;
      theme = {
        background = "#000000";
        border.location = "none";
        buttons = {
          background = "#1c1c1c";
          battery.enableBorder = false;
          clock.enableBorder = false;
          enableBorders = false;
          icon = "#ffffff";
          media.enableBorder = false;
          modules.netstat.enableBorder = false;
          monochrome = true;
          network.enableBorder = false;
          notifications.enableBorder = false;
          style = "default";
          systray.enableBorder = false;
          text = "#ffffff";
          workspaces = {
            active = "#ffffff";
            enableBorder = false;
            numbered_active_underline_color = "#ffffff";
            occupied = "#ffffff";
          };
        };
        floating = false;
        location = "top";
        menus = {
          background = "#000000";
          buttons.default = "#ff8000";
          card_radius = "0.4em";
          cards = "#1e1e2e";
          check_radio_button.active = "#ff8000";
          dropdownmenu.text = "#ffffff";
          iconbuttons.active = "#ff8000";
          iconbuttons.passive = "#ffffff";
          icons.active = "#ff8000";
          label = "#ffffff";
          listitems.active = "#ffffff";
          menu.dashboard.profile.size = "8.5em";
          monochrome = true;
          popover.text = "#ffffff";
          progressforeground = "#ff8000";
          slider.primary = "#ff8000";
          switch.enabled = "#ff8000";
          text = "#f6f5f4";
          tooltip.text = "#ffffff";
        };
        outer_spacing = "0.4em";
        transparent = false;
        font = {
          label = "JetBrainsMono Nerd Font";
          name = "JetBrainsMono Nerd Font";
          size = "0.9rem";
          weight = 600;
        };
        osd = {
          location = "bottom";
          margins = "7px 7px 200px 7px";
          muted_zero = false;
          orientation = "horizontal";
          scaling = 90;
        };
      };
      wallpaper.enable = false;
    };
  };
}
