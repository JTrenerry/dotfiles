{ pkgs, self, ... }:
{
  environment.systemPackages = [
    pkgs.dotnetCorePackages.aspnetcore_9_0   # REMOVE FOR CLASSES
    pkgs.icu
    (import "${self}/modules/scripts/move.nix" { inherit pkgs; })
  ];

  users.users."jackson" = {
    isNormalUser = true;
    description = "jackson";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "audio"
      "daemon"
    ];
  };

}
