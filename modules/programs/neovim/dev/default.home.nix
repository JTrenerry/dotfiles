{pkgs, ...}: {
  imports = [
    ./python.home.nix
    ./shell.home.nix
    ./typst.home.nix
    ./nix.home.nix
  ];

  programs.gh = {
    enable = true;

    settings = {
      git_protocol = "ssh";
    };
  };

  home.packages = with pkgs; [
    texlive.combined.scheme-full
  ];
}
