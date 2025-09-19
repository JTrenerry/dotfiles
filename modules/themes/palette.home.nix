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
  paletteFile = ./${userSettings.theme}.json;
  palette = builtins.fromJSON (builtins.readFile paletteFile);
in
{
  options.palette = mkOption { type = types.attrsOf types.raw; };
  config = {
    inherit palette;
  };
}
