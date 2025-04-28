{ config, ... }:

{
  programs = {
    kitty = {
      enable = true;
      themeFile = "rose-pine-moon";
      settings = {
        clipboard_control = "write-clipboard no-ask read-clipboard no-ask";
      };
    };
  };
}
