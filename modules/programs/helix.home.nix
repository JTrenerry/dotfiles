{ pkgs, ... }:
{
  home.shellAliases = {
    vim = "hx";
    nvim = "hx";
    vi = "hx";
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "rose_pine_moon";
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
        scope = "source.nix";
        file-types = [ "nix" ];
        auto-format = true;
        formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        language-servers = [ "nil" ];
        indent = {
          tab-width = 2;
          unit = " ";
        };
      }
      {
        name = "toml";
        scope = "source.toml";
        file-types = [ "toml" ];
        auto-format = true;
        language-servers = [ "taplo" ];
      }
      {
        name = "json";
        scope = "source.json";
        file-types = [ "json" ];
        auto-format = true;
        language-servers = [ "json" ];
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
      json = {
        command = "${pkgs.nodePackages.vscode-json-languageserver}/bin/vscode-json-languageserver";
      };
    };
  };
}
