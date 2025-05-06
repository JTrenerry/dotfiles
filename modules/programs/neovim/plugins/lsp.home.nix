{
  programs.nixvim = {
    plugins = {
      lsp-format.enable = true;
      lsp-lines.enable = true;

      lsp = {
        enable = true;

        inlayHints = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          clangd.enable = true;
          texlab.enable = true;
          hls = {
            enable = true;
            installGhc = false;
          };
          dafny.enable = true;
          html.enable = true;
        };
      };
    };
  };
}
