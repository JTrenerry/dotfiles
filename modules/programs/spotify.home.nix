  { pkgs, lib, system, inputs, config,  ... }:
{
  # import the flake's module for your system
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  # configure spicetify :)
  programs = {
    spicetify = {
      enable = true;
    };
  };
}
