{
  userSettings,
  systemSettings,
  inputs,
  self,
  ...
}:
{
  programs.home-manager.enable = true;

  imports = [
    inputs.nix-index-database.homeModules.nix-index

    "${self}/modules/programs/stylix.home.nix"
    "${self}/modules/programs/anyrun.home.nix"
  ];

  home.username = "${userSettings.user}";
  home.homeDirectory = "/home/${userSettings.user}";
  home.stateVersion = systemSettings.stateVersion;
}
