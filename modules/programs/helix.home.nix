{
  pkgs,
  lib,
  config,
  ...
}:
with config.lib.stylix.colors;
{
  home.shellAliases = {
    vim = "hx";
    nvim = "hx";
    vi = "hx";
  };

  programs.helix = {
    enable = true;
    settings = {
      # theme = lib.mkForce "eva";
      editor.undercurl = true;
      editor.true-color = true;
      editor.lsp.display-inlay-hints = true;
      editor.soft-wrap.enable = true;
      editor.bufferline = "multiple";
      editor.end-of-line-diagnostics = "hint";
      editor.inline-diagnostics.cursor-line = "error";
    };

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        language-servers = [ "nil" ];
      }
      {
        name = "toml";
        auto-format = true;
        language-servers = [ "taplo" ];
      }
    ];

    languages.language-server = {
      nil = {
        command = "${pkgs.nil}/bin/nil";
        config = {
          nix.flake = {
            autoEvalInputs = true;
            autoArchive = true;
          };
        };
      };
      taplo = {
        command = "${pkgs.taplo}/bin/taplo";
        args = [
          "lsp"
          "stdio"
        ];
      };
    };

    themes = {
      rose-pine-moon = {
        inherits = "stylix";
        ui.background = "{}";
      };
    };
  };
}
