{ pkgs, nix-path, ... }:


{
  environment.systemPackages = [
    pkgs.libnotify
    pkgs.dunst
    (import ./switch.nix { inherit pkgs nix-path; })
  ];
}
