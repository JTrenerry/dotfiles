{ config, ... }:

{
  programs = {
    kitty = {
      enable = true;
      themeFile = "rose-pine-moon";
      settings = {
        clipboard_control = "write-unsafe";
      };
    };
  };
}
