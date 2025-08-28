{ pkgs, systemSettings, ... }:

{
  services = {
    greetd = {
      enable = true;

      settings = rec {
      };
    };
  };

  systemd.services.greetd = {
    serviceConfig.Type = "idle";
    unitConfig.After = [ "docker.service" ];
  };
}
