{
  pkgs,
  inputs,
  config,
  self,
  systemSettings,
  lib,
  userSettings,
  ...
}:
let
  inherit (lib) mkOption types;
  palette = "${systemSettings.nixPath}/${userSettings.theme}.json";
in
{
  imports = [
    inputs.stylix.homeManagerModules.stylix
    "${self}/modules/themes/palette.home.nix"
  ];

  stylix = {
    enable = true;
    autoEnable = true;
    polarity = "dark";
    targets = {
      hyprland.enable = false;
      firefox.enable = false;
      rofi.enable = false;
      dunst.enable = false;
      kitty.enable = false;
      nixvim.enable = false;
      waybar.enable = false;
      hyprlock.enable = false;
    };

    base16Scheme = "${pkgs.base16-schemes}/share/themes/${userSettings.theme}.yaml";
    image = /home/jackson/.wallpaper;
  };
}
