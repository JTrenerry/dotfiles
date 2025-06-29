{ pkgs, self, userSettings, ... }:
{
  imports = [
    "${self}/modules/programs/spotify.home.nix"
    "${self}/modules/programs/fastfetch.home.nix"
    "${self}/modules/programs/cava.home.nix"
    "${self}/modules/programs/neovim/default.home.nix"
    "${self}/modules/shell/default.home.nix"
    #"${self}/modules/programs/firefox.home.nix"
    #"${self}/modules/programs/vesktop.home.nix"

    ./git.home.nix
  ];

  home.packages = with pkgs; [
    # Temp fixes / classes / to be moved
    wechat-uos
    staruml
    nodejs_24

    firefox
    thunderbird
    vesktop
    upower
    qmk
    via

    # Containers
    docker-compose

    # SSH
    cloudflared

    # Office / Productivity / IDE
    jetbrains.idea-ultimate # Java IDE
    obsidian # Note taking app
    libreoffice-fresh # Text editor
    zoom-us # Work

    # Misc
    unzip
    zip

    btop

    brightnessctl

    blueman # bluetooth
    bluetuith
    bluez

    pavucontrol # audio
    networkmanagerapplet # network
    postman # API docs
    grimblast #screenshot
    hyprlock # lockscreen
    pinta   # Image editor
    foot   # Backup terminal
    swww   # Wallpaper
    kittysay
    uwuify
    lolcat
    meow
    imagemagick
    tree

    rpi-imager
    acpi
    platformio
  ];

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine-moon";
    };
  };
}
