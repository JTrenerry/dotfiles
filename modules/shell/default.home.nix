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
        test -r '/home/jackson/.opam/opam-init/init.sh' && . '/home/jackson/.opam/opam-init/init.sh' > /dev/null 2> /dev/null || true
      '';
    };
  };
}
