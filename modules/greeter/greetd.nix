{ ... }:

{
  services = {
    greetd = {
      enable = true;
    };
  };

  systemd.services.greetd = {
    serviceConfig.Type = "idle";
    unitConfig.After = [
      "docker.service"
      "nix-gc.service"
    ];
  };
}
