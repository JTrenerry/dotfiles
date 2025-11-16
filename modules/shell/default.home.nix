{ inputs, pkgs, ... }:
{
  imports = [
    ./starship.home.nix
    ./aliases.home.nix
  ];

  home.packages = [
    inputs.terminal-wakatime.packages.${pkgs.system}.default
  ];

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };

    bash = {
      enable = true;

      bashrcExtra = ''
        eval "$(direnv hook bash)"
        eval "$(terminal-wakatime init)"
      '';
    };
  };
}
