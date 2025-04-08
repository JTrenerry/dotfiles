{ pkgs, self, ... }:
{
  imports = [
    "${self}/modules/programs/code.home.nix"
  ];

  home.packages = with pkgs; [
    # Per computer setup here
  ];
}
