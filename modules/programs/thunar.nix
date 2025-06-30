{ pkgs, ... }:
{
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce;
      [
        thunar-archive-plugin
        thunar-volman
      ];
  };

  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.udisks2.enable = true;
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [
    file-roller
    openconnect # TODO: MOVE THIS SOMEWHERE ELSE WHEN I CONFIG THE VPNS
  ];
}
