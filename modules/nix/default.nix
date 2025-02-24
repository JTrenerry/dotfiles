{
  systemSettings,
  pkgs,
  lib,
  ...
}:
{
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };

    package = pkgs.nixVersions.stable;

    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      sandbox = true;
      trusted-users = systemSettings.trustedUsers;
    };

    registry.devtemplates = {
      to = {
        owner = "JTrenerry";
        repo = "nix-templates";
        type = "github";
      };
      from = {
        id = "devtemplates";
        type = "indirect";
      };
    };
  };

  nixpkgs = {
    hostPlatform = lib.mkDefault systemSettings.system;
    overlays =
      [
      ];
    config = {
      allowUnfree = true;
    };
  };

  system.stateVersion = systemSettings.stateVersion;
}
