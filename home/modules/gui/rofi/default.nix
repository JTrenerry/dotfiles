{ pkgs, config, ...}:

{
  programs = {
    rofi = {
      enable = true;
      cycle = true;
      location = "center";
      pass = { };
      plugins = with pkgs; [
        rofi-calc
        rofi-emoji
        rofi-systemd
        rofi-bluetooth
        rofi-power-menu
      ];
      extraConfig = {
        modes = "drun,calc,recursivebrowser";
        show-icons = true;
      };
      package = pkgs.rofi-wayland;
      theme = "${config.colours.rofi}";
    };
  };
}
