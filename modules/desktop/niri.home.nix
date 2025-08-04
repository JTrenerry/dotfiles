{
  pkgs,
  inputs,
  config,
  self,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
    inputs.niri.homeModules.stylix

    "${self}/modules/programs/hyprlock.home.nix"
    "${self}/modules/services/hypridle.home.nix"
    "${self}/modules/programs/rofi.home.nix"
    "${self}/modules/programs/kitty.home.nix"
    "${self}/modules/programs/waybar.home.nix"
    "${self}/modules/services/dunst.home.nix"
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  programs.niri.package = pkgs.niri-unstable;
  programs.niri.enable = true;
  programs.niri.settings = {
    prefer-no-csd = true;

    spawn-at-startup = [
      {
      command = [
        "dbus-update-activation-environment"
        "--systemd"
        "WAYLAND_DISPLAY"
        "XDG_CURRENT_DESKTOP"
      ];
      }
      { command = [ "${pkgs.xwayland-satellite}/bin/xwayland-satellite" ]; }
      { command = [ "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1" ]; }
      {
        command = [
          "swww"
          "init"
        ];
      }
      { command = [ "overview" ]; }
    ];

    input = {
      focus-follows-mouse.enable = true;
      warp-mouse-to-focus = true;
    };

    outputs."eDP-1".scale = 1;

    environment = {
      QT_QPA_PLATFORM = "wayland";
      DISPLAY = ":0";
    };

    layout = {
      gaps = 5;
      struts = {
        bottom = 1;
        top = 1;
        left = 1;
        right = 1;
      };
      always-center-single-column = true;
      preset-column-widths = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
        { proportion = 1.0; }
      ];
      default-column-width = {
        proportion = 0.75;
      };
      focus-ring = {
        enable = false;
        width = 0.5;
        active.color = config.palette.primaryAccent;
      };
    };

    window-rules = [
      {
        matches = [ { app-id = "^kitty$"; } ];
        default-column-width.proportion = 0.5;
      }
    ];

    # overview.backdrop-color = config.palette.primaryAccent;

    binds = with config.lib.niri.actions; rec {
      # Utils
      # Basics
      "Mod+C".action = close-window;
      "Mod+F".action = fullscreen-window;
      "Mod+R".action = switch-preset-column-width;

      # Commands
      "Mod+S".action = screenshot;
      "Mod+Shift+Slash".action = show-hotkey-overlay;

      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action = spawn "wpctl" "set-volume" "-l" "1.4" "@DEFAULT_AUDIO_SINK@" "5%+";
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action = spawn "wpctl" "set-volume" "-l" "1.4" "@DEFAULT_AUDIO_SINK@" "5%-";
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";
      };

      "XF86MonBrightnessUp".action = spawn "brightnessctl" "set" "5%+";
      "XF86MonBrightnessDown".action = spawn "brightnessctl" "set" "5%-";

      # Spawns
      "Mod+Q".action = spawn "kitty";
      "Mod+D".action = spawn "anyrun";
      "Mod+Escape".action = spawn "hyprlock";
      "Mod+B".action = spawn "blueman-manager";
      "Mod+V".action = spawn "pavucontrol";
      "Mod+I".action = spawn "nm-connection-editor";

      "Mod+Shift+M".action = quit { skip-confirmation = true; };

      # Navigation:
      "Mod+E".action = center-column;
      "Mod+H".action = focus-column-left-or-last;
      "Mod+L".action = focus-column-right-or-first;
      "Mod+K".action = focus-window-or-workspace-up;
      "Mod+J".action = focus-window-or-workspace-down;
      "Mod+Left".action = focus-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Up".action = focus-window-up;
      "Mod+Down".action = focus-window-down;
      "Mod+G".action = toggle-overview;

      # Workspace Navigation
      "Mod+1".action = focus-workspace 1;
      "Mod+2".action = focus-workspace 2;
      "Mod+3".action = focus-workspace 3;
      "Mod+4".action = focus-workspace 4;
      "Mod+5".action = focus-workspace 5;
      "Mod+6".action = focus-workspace 6;
      "Mod+7".action = focus-workspace 7;
      "Mod+8".action = focus-workspace 8;
      "Mod+9".action = focus-workspace 9;
      "Mod+0".action = focus-workspace 0;

      "Mod+WheelScrollDown".action = focus-workspace-down;
      "Mod+WheelScrollUp".action = focus-workspace-up;
      "Mod+WheelScrollRight".action = focus-column-right;
      "Mod+WheelScrollLeft".action = focus-column-left;

      # Moving Windows:
      "Mod+Period".action = consume-or-expel-window-right;
      "Mod+Comma".action = consume-or-expel-window-left;

      "Mod+Shift+H".action = move-column-left;
      "Mod+Shift+L".action = move-column-right;
      "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
      "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
      "Mod+Shift+Left".action = move-column-left;
      "Mod+Shift+Right".action = move-column-right;
      "Mod+Shift+Up".action = move-window-up;
      "Mod+Shift+Down".action = move-window-down;
      "Mod+Ctrl+K".action = move-column-to-workspace-up;
      "Mod+Ctrl+J".action = move-column-to-workspace-down;

      # Rearranging Workspaces
      "Mod+Ctrl+Shift+J".action = move-workspace-down;
      "Mod+Ctrl+Shift+K".action = move-workspace-up;

      # Resizing Windows:
      "Mod+Minus".action = set-column-width "-5%";
      "Mod+Equal".action = set-column-width "+5%";
      "Mod+Plus".action = set-column-width "+5%";
      "Mod+Shift+Minus".action = set-window-height "-5%";
      "Mod+Shift+Equal".action = set-window-height "+5%";
      "Mod+Shift+Plus".action = set-window-height "+5%";
    };
  };
}
