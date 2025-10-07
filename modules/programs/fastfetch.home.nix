{
  pkgs,
  self,
  config,
  ...
}:
let
  brrtfetch = pkgs.callPackage "${self}/modules/programs/brrtfetch.home.nix" { };
in
{
  home.packages = [
    brrtfetch
  ];

  programs.fastfetch = {
    enable = true;
    settings = {
      # Not needed due to brrtfetch, leaving incase of not wanting brrt
      # logo = {
      #   padding = {
      #     top = 2;
      #   };
      # };

      display = {
        separator = " -> ";
      };

      modules = [
        "title"
        "separator"
        {
          type = "os";
          key = " OS";
          keyColor = "yellow";
          format = "{2}";
        }
        {
          type = "kernel";
          key = "├";
          keyColor = "yellow";
        }
        {
          type = "packages";
          key = "├󰏖";
          keyColor = "yellow";
        }
        {
          type = "shell";
          key = "└";
          keyColor = "yellow";
        }
        "break"

        {
          type = "wm";
          key = " DE/WM";
          keyColor = "blue";
        }
        {
          type = "lm";
          key = "├󰧨";
          keyColor = "blue";
        }
        {
          type = "wmtheme";
          key = "├󰉼";
          keyColor = "blue";
        }
        {
          type = "icons";
          key = "├󰀻";
          keyColor = "blue";
        }
        "break"
        {
          type = "host";
          key = "󰌢 PC";
          keyColor = "green";
        }
        {
          type = "cpu";
          key = "├󰻠";
          keyColor = "green";
        }
        {
          type = "gpu";
          key = "├󰍛";
          keyColor = "green";
        }
        {
          type = "disk";
          key = "├";
          keyColor = "green";
        }
        {
          type = "memory";
          key = "├󰑭";
          keyColor = "green";
        }
        {
          type = "display";
          key = "├󰍹";
          keyColor = "green";
        }
        {
          type = "uptime";
          key = "└󰅐";
          keyColor = "green";
        }
      ];
    };
  };
}
