{ self, userSettings, pkgs, ... }:

{
  imports = [
    (self + "/modules/greeter/tuigreet.nix")
  ];

  environment.systemPackages = [
    (import (self + "/modules/scripts/overview.nix") {
      inherit pkgs;
    })
    pkgs.jq
    pkgs.killall
  ];
}
