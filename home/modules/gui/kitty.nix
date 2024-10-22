{ config, ... }:

{
  programs = {
    kitty = {
      enable = true;
      themeFile = "${config.colours.kebab}";
    };
  };
}
