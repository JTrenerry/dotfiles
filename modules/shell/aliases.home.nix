{ systemSettings, ... }:
let
  nix-path = systemSettings.nixPath;
in
{
  home.shellAliases = {
    cdn = "cd ${nix-path}"; # Go to the nixos config directory
    fetch = "fastfetch";
    neofetch = "fastfetch";
    die = "shutdown now";
   # NOTE Add more aliases here





    # NOTE THE DOTS
    ".." = "cd ..";
    "..." =  "cd ../..";
    "...." = "cd ../../..";
    "....." = "cd ../../../..";
    "......" = "cd ../../../../..";
  };
}
