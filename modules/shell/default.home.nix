{
  imports = [
    ./starship.home.nix
    ./aliases.home.nix
  ];

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration= true;
      nix-direnv.enable = true;
    };

    bash = {
      enable = true;

      bashrcExtra = ''eval "$(direnv hook bash)"'';
    };
  };
}
