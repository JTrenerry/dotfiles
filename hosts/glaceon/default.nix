{
  pkgs,
  self,
  lib,
  ...
}:
{
  imports = [
    ./hardware.nix
    "${self}/modules/bootloader/systemd.nix"
    "${self}/modules/services/pipewire.nix"
    "${self}/modules/services/bluetooth.nix"
  ];

  time.timeZone = lib.mkForce "Australia/brisbane";
  services.automatic-timezoned.enable = true;

  networking = {
    networkmanager.enable = true;
  };

  fonts = {
    enableDefaultPackages = true;

    packages = with pkgs; [
      carlito
      dejavu_fonts
      ipafont
      kochi-substitute
      source-code-pro
      ttf_bitstream_vera
    ];

    fontconfig.defaultFonts = {
      monospace = [
        "DejaVu Sans Mono"
        "IPAGothic"
      ];
      sansSerif = [
        "DejaVu Sans"
        "IPAPGothic"
      ];
      serif = [
        "DejaVu Serif"
        "IPAPMincho"
      ];
    };
  };

  boot.tmp.cleanOnBoot = true;

  systemd.targets = {
    sleep.enable = true;
    suspend.enable = true;
    hibernate.enable = true;
    hybrid-sleep.enable = true;
  };
}
