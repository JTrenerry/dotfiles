  { pkgs, lib, system, inputs, config,  ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${system};
in
{
  # import the flake's module for your system
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  # configure spicetify :)
  programs = {
    spicetify = {
      enable = true;
      theme = spicePkgs.themes.ziro;
      colorScheme = "${config.colours.kebab}";
    };
  };
}
