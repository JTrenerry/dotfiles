{
  osConfig,
  inputs,
  pkgs,
  config,
  systemSettings,
  ...
}:
{
  # imports = [ inputs.anyrun.homeManagerModules.default ];

  programs.anyrun = {
    enable = true;
    config = {
      x = {
        fraction = 0.5;
      };
      y = {
        fraction = 0.1;
      };
      width = {
        fraction = 0.3;
      };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = false;
      showResultsImmediately = true;
      maxEntries = 10;

      plugins = (
        with inputs.anyrun.packages.${pkgs.system};
        [
          applications
          rink
          shell
          translate
          websearch
        ]
      );
    };

    extraCss = ''
      window {
          background: transparent;
      }

      text {
          padding: 10px 14px;
          background: #${config.lib.stylix.colors.base00};
          color: #${config.lib.stylix.colors.base05};
          
          border-top-left-radius: 10px;
          border-top-right-radius: 10px;
          
          font-size: 18px;

          border: 2px solid transparent;
          outline-offset: -2px;
      }

      text:focus {
          outline: 2px solid #${config.palette.primaryAccent};
      }

      .match {
          padding: 1px;
          border-radius: 8px;
          border-color: #${config.lib.stylix.colors.base02};

      .match:hover, .match:selected {
          background: #${config.lib.stylix.colors.base02};
      }

      .match .title {
          font-size: 16px;
          font-weight: 500;
          color: #${config.lib.stylix.colors.base05};
      }

      .match .description {
          font-size: 13px;
          color: #${config.lib.stylix.colors.base03};
          margin-top: 2px;
      }
    '';
    extraConfigFiles."nixos-options.ron".text =
      let
        nixos-options = osConfig.system.build.manual.optionsJSON + "/share/doc/nixos/options.json";
        hm-options =
          inputs.home-manager.packages.${pkgs.system}.docs-json + "/share/doc/home-manager/options.json";
        options = builtins.toJSON {
          ":nix" = [ nixos-options ];
          ":hm" = [ hm-options ];
          ":nall" = [
            nixos-options
            hm-options
          ];
        };

      in
      ''
        Config(
            options: ${options},
            min_score: 0,
            max_entries: Some(10)
         )
      '';
  };
}
