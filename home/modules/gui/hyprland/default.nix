{ pkgs, lib, inputs, ... }:

{
  imports = [
    # TODO Import new tui modules here
    ./hyprland.nix
  ];

  home.packages = with pkgs; [
    # NOTE Add user packages that have a gui here
    waybar
    swww
  ];
}