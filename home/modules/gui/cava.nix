{ config, ... }:

{
  programs = {
    cava = {
      enable = true;
      settings = {
        general.framerate = 60;
        smoothing.noise_reduction = 88;
        color = {
          background = "'${config.colours.col1}'";
          gradient = 1;
          gradient_count = 6;
          gradient_color_1 = "'${config.colours.col10}'";
          gradient_color_2 = "'${config.colours.col11}'";
          gradient_color_3 = "'${config.colours.col12}'";
          gradient_color_4 = "'${config.colours.col9}'";
          gradient_color_5 = "'${config.colours.col8}'";
          gradient_color_6 = "'${config.colours.col7}'";
        };
      };
    };
  };
}
