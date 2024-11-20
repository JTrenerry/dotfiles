{ pkgs, lib, inputs, config, ... }:

{
  imports = [
    # TODO Import new gui modules here
    ./kitty.nix
    ./cava.nix
    ./dunst.nix
    ./stylix.nix
    ./spotify.nix
    ./niri.nix
    ./waybar.nix
    ./hyprlock.nix

    ./rofi
  ];

  home.packages = with pkgs; [
    # NOTE Add user packages that have a gui here
    rpi-imager

    # Important
    firefox
    brightnessctl # Brightness should probs be in tui

    # IM / Editors
    vesktop # to do be moved for conf stuff

    # Office / Productivity / IDE
    jetbrains.idea-ultimate # Java IDE
    obsidian # Note taking app
    libreoffice-fresh # Text editor
    zoom-us # Work

    # Misc
    blueman # bluetooth
    pavucontrol # audio
    networkmanagerapplet # network
    postman # API docs
    grimblast #screenshot
    hyprlock # lockscreen
    pinta   # Image editor
    xfce.thunar   # File system visual
    foot   # Backup terminal
    swww   # Wallpaper
  ];

  gtk = {
    enable = true;

    iconTheme = {
      package = "${config.colours.icon-package}";
      name = "${config.colours.kebab}";
    };
  };
}
