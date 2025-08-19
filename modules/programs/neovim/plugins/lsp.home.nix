{
  programs.nixvim = {
    plugins = {
      lsp-format.enable = true;
      lsp-lines.enable = true;
      lsp-signature.enable = true;
      lsp = {
        enable = true;

        inlayHints = true;

        keymaps = {
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
          eslint.enable = true;
          ts_ls.enable = true;
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
