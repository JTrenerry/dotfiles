{
  pkgs,
  self,
  ...
}:
{
  imports = [
    "${self}/modules/programs/spotify.home.nix"
    "${self}/modules/programs/fastfetch.home.nix"
    "${self}/modules/programs/cava.home.nix"
    "${self}/modules/programs/helix.home.nix"
    "${self}/modules/shell/default.home.nix"
    #"${self}/modules/programs/firefox.home.nix"
    #"${self}/modules/programs/neovim/default.home.nix"
    #"${self}/modules/programs/vesktop.home.nix"

    ./git.home.nix
  ];

  home.packages = with pkgs; [
    wechat-uos # TODO: move
    zoxide # Better cd
    upower # Power management
    obs-studio # TODO: move
    docker-compose # Containers
    cloudflared # SSH through cf tunnels
    tree # Directory Visualisation
    acpi # Battery
    unzip # Unzip
    zip # Zip
    btop # Computer Stats
    blueman # Bluetooth
    bluetuith # Bluetooth
    bluez # Bluetooth
    pavucontrol # audio
    networkmanagerapplet # network

    # Cat related programs
    kittysay
    uwuify
    lolcat
    meow

    jetbrains.idea-ultimate # TODO: moveJava IDE
    obsidian # TODO: Note taking app
    zoom-us # TODO: move
    postman # TODO: move
    brightnessctl # Brightness stuff TODO: move to desktop?
    firefox # TODO: move
    thunderbird # TODO: move
    vesktop # TODO: move
    grimblast # TODO: move Screenshot
    slurp # TODO: move Screenshot
    hyprlock # TODO: move Lockscreen
    pinta # TODO: move Image editor
    foot # TODO: move Backup terminal
    swww # TODO: move Wallpaper
  ];

  gtk = {
    enable = true;

    # TODO: Hard coded themeing stuff, move to a variable in theme
    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine-moon";
    };
  };
}
