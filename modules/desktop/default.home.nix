{
  pkgs,
  self,
  ...
}:
{
  imports = [
    "${self}/modules/programs/spotify.home.nix"
    "${self}/modules/programs/firefox.home.nix"
  ];

  home.packages = with pkgs; [
    wechat-uos
    obs-studio
    jetbrains.idea-ultimate # Java IDE
    obsidian # Note taking app
    zoom-us
    postman
    brightnessctl # Brightness stuff to desktop?
    thunderbird
    vesktop
    grimblast # Screenshot
    slurp # Screenshot
    hyprlock # Lockscreen
    pinta # Image editor
    foot # Backup terminal
    swww # Wallpaper
    zathura # pdf viewer
    graphviz
  ];

  gtk = {
    enable = true;

    # TODO: Hard coded themeing stuff, move to a variable in theme
    iconTheme = {
      package = pkgs.rose-pine-icon-theme;
      name = "rose-pine-moon";
    };
  };
}
