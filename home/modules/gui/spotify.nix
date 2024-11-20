  { pkgs, lib, system, inputs, config,  ... }:
let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${system};

    colour = if config.colours.spicetify == "" then config.colours.kebab else config.colours.spicetify;
in
{
  # import the flake's module for your system
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  # configure spicetify :)
  programs = {
    spicetify = {
      enable = true;
      theme = "${config.colours.spicetify-theme}";
      colorScheme = "${colour}";
    };
  };
}
