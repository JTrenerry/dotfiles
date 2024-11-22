{ pkgs, ... }:
{
  users.users."jackson" = {
    isNormalUser = true;
    description = "mcarthur";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "audio"
      "daemon"
    ];
  };

}
