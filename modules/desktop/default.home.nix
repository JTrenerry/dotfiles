{
  pkgs,
  self,
  ...
}:
{
  imports = [
    "${self}/modules/programs/spotify.home.nix"
  ];

  home.packages = with pkgs; [
    wechat-uos
    obs-studio
    jetbrains.idea-ultimate # Java IDE
    obsidian # Note taking app
    zoom-us
    postman
    brightnessctl # Brightness stuff to desktop?
    firefox
    thunderbird
    vesktop
    grimblast # Screenshot
    slurp # Screenshot
    hyprlock # Lockscreen
    pinta # Image editor
    foot # Backup terminal
    swww # Wallpaper
    zathura # pdf viewer
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
