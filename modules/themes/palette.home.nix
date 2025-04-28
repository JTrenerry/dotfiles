{
  pkgs,
  inputs,
  config,
  lib,
  userSettings,
  ...
}:
let
  inherit (lib) mkOption types;
  palette = "./${userSettings.theme}.json";
in
{
  options.palette = mkOption { type = types.attrsOf types.raw; };
  config = {
    inherit palette;
  };
}
