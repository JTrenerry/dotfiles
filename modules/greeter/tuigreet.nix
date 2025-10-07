{
  pkgs,
  lib,
  config,
  self,
  ...
}:
let
  inherit (lib) concatStringsSep getExe;
  sessionData = config.services.displayManager.sessionData.desktops;
  sessionPath = concatStringsSep ":" [
    "${sessionData}/share/wayland-sessions"
    "${sessionData}/share/xsessions"
  ];
  tuigreet = getExe pkgs.tuigreet;
in
{
  imports = [
    "${self}/modules/greeter/greetd.nix"
  ];

  services.greetd.settings = {
    default_session = {
      command = concatStringsSep " " [
        tuigreet
        "-g 'Welcome to NixOS!'"
        "--asterisks"
        "--remember"
        "--remember-user-session"
        "--time"
        "--sessions '${sessionPath}'"
      ];
      user = "greeter";
    };
  };
}
