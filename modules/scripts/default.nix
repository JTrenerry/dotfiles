{ pkgs, systemSettings, ... }:

let
  nix-path = systemSettings.nixPath;
in
{
  environment.systemPackages = [
    (import ./switch.nix { inherit pkgs nix-path; })
  ];
}
