{ pkgs, systemSettings, ... }:

{
  services = {
    greetd = {
      enable = true;

      settings = rec {
      };
    };
  };
}
