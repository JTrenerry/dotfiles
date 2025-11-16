{ systemSettings, self, ... }:
let
  nix-path = systemSettings.nixPath;
in
{
  home.shellAliases = {
    cdn = "cd ${nix-path}"; # Go to the nixos config directory
    neofetch = "brrtfetch --multiplier 90 --fps 5 ${self}/assets/brrtfetch.gif";
    fetch = "brrtfetch --multiplier 90 --fps 5 ${self}/assets/brrtfetch.gif";
    die = "shutdown now";
    kd = "kitty --detach";
    # NOTE Add more aliases here

    # NOTE THE DOTS
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    "......" = "cd ../../../../..";
  };
}
