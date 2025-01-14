{ self, userSettings, pkgs, ... }:

{
  imports = [
    "${self}/modules/greeter/tuigreet.nix"
  ];
}
