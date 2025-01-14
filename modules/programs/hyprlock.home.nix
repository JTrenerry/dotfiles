let
  font = "JetBrainsMono Nerd Font";
  base = "#232136";
  surface = "#2a273f";
  red = "#eb6f92";
  orange = "#ea9a97";
  yellow = "#f6c177";
  green = "#95b1ac";
  aqua = "#9ccfd8";
  blue = "#3e8fb0";
  purple = "#c4a7e7";
in
{
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
          color = "${base}";
        }
      ];

      label = [

        # time
        {
          monitor = "";
          text = "$time";
          color = "${purple}";
          font_size = 90;
          font_family = "${blue}";
          position = "-30, 0";
          halign = "right";
          valign = "top";
        }

        # Date
        {
          monitor = "";
          text = ''cmd[update:43200000] date +"%A, %d %B %Y"'';
          color = "${aqua}";
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
          border_color = "${surface}";
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
          outer_color = "${surface}";
          inner_color = "${purple}";
          font_color = "${purple}";
          fade_on_empty = false;
          placeholder_text = "Welcome Back!";
          hide_input = false;
          check_color = "${blue}";
          fail_color = "${red}";
          fail_text = ''<i>$FAIL <b>($ATTEMPTS)</b></i>'';
          capslock_color = "${yellow}";
          position = "0, -47";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
