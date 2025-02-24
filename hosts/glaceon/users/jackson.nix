{ pkgs, self, ... }:
{
  environment.systemPackages = [
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
