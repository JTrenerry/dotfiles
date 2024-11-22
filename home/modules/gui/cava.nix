{ config, ... }:

{
  programs = {
    cava = {
      enable = true;
      settings = {
        general.framerate = 60;
        smoothing.noise_reduction = 88;
        color = {
          background = "'${config.colours.base}'";
          gradient = 1;
          gradient_count = 6;
          gradient_color_1 = "'${config.colours.blue}'";
          gradient_color_2 = "'${config.colours.aqua}'";
          gradient_color_3 = "'${config.colours.purple}'";
          gradient_color_4 = "'${config.colours.orange}'";
          gradient_color_5 = "'${config.colours.yellow}'";
          gradient_color_6 = "'${config.colours.red}'";
        };
      };
    };
  };
}
