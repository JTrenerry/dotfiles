{ pkgs, inputs, system, config, ... }:

let
  font = "JetBrainsMono Nerd Font";
in
{
  services.hypridle = {
    enable = true;
  };
  xdg.configFile."hypr/hypridle.conf".text = ''
    general {
        lock_cmd = pidof hyprlock || hyprlock       # avoid starting multiple hyprlock instances.
        before_sleep_cmd = loginctl lock-session    # lock before suspend.
        after_sleep_cmd = hyprctl dispatch dpms on  # to avoid having to press a key twice to turn on the display.
    }
  '';

  programs.hyprlock = {
    enable = true;
    sourceFirst = true;
    settings = {

      general = {
        disable_loading_bar = true;
        hide_cursor = true;
      };

      background = [
        {
          monitor = "";
          path = "$HOME/.wallpaper";
          blur_passes = 0;
          color = "${config.colours.base}";
        }
      ];

      label = [

        # time
        {
          monitor = "";
          text = "$time";
          color = "${config.colours.purple}";
          font_size = 90;
          font_family = "${config.colours.blue}";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }

        # Date
        {
          monitor = "";
          text = ''cmd[update:43200000] date +"%A, %d %B %Y"'';
          color = "${config.colours.aqua}";
          font_size = 25;
          font_family = font;
          position = "-30, -150";
          halign = "right";
          valign = "top";
        }
      ];

      # User pfp
      image = [
        {
          monitor = "";
          path = "$HOME/.face";
          size = "300";
          rounding = -1;
          border_size = 0;
          border_color = "${config.colours.surface}";
          position = "0, 75";
          halign = "center";
          valign = "center";
        }
      ];

      # Input field
      input-field = [
        {
          monitor = "";
          size = "300, 60";
          dots_size = 0.2;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "${config.colours.surface}";
          inner_color = "${config.colours.purple}";
          font_color = "${config.colours.purple}";
          fade_on_empty = false;
          placeholder_text = "Welcome Back!";
          hide_input = false;
          check_color = "${config.colours.blue}";
          fail_color = "${config.colours.red}";
          fail_text = ''<i>$FAIL <b>($ATTEMPTS)</b></i>'';
          capslock_color = "${config.colours.yellow}";
          position = "0, -47";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
