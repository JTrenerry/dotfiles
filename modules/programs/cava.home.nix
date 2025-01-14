let
  base = "#232136";
  red = "#eb6f92";
  orange = "#ea9a97";
  yellow = "#f6c177";
  green = "#95b1ac";
  aqua = "#9ccfd8";
  blue = "#3e8fb0";
  purple = "#c4a7e7";
in
{
  programs = {
    cava = {
      enable = true;
      settings = {
        general.framerate = 60;
        smoothing.noise_reduction = 88;
        color = {
          background = "'${base}'";
          gradient = 1;
          gradient_count = 6;
          gradient_color_1 = "'${blue}'";
          gradient_color_2 = "'${aqua}'";
          gradient_color_3 = "'${purple}'";
          gradient_color_4 = "'${orange}'";
          gradient_color_5 = "'${yellow}'";
          gradient_color_6 = "'${red}'";
        };
      };
    };
  };
}
