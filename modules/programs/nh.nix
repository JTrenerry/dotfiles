{
  config,
  pkgs,
  lib,
  systemSettings,
  ...
}:
let
  nix-path = systemSettings.nixPath;
in
{
  programs.nh = {
    enable = true;
    # flake = /etc/nixos;
  };

  environment.sessionVariables = {
    FLAKE = lib.mkForce "${nix-path}";
  };
}