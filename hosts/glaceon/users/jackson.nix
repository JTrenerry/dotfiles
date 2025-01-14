{ pkgs, ... }:
{
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
