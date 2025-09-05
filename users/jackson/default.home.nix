{
  pkgs,
  self,
  ...
}:
{
  imports = [
    "${self}/modules/programs/fastfetch.home.nix"
    "${self}/modules/programs/cava.home.nix"
    "${self}/modules/programs/helix.home.nix"
    "${self}/modules/shell/default.home.nix"
    ./git.home.nix
  ];

  home.packages = with pkgs; [
    zoxide # Better cd
    upower # Power management
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
