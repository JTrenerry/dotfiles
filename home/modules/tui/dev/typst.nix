{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      typst
      typstyle
      zathura
    ];
  };

  programs.nixvim = {
    files."after/ftplugin/typst.lua".keymaps = [
      {
        mode = "n";
        key = "<leader>m";
        action = ":TypstWatch<cr>";
      }
    ];

    plugins = {
      lsp-format.lspServersToEnable = ["tinymist"];

      lsp.servers.tinymist = {
        enable = true;
        settings.formatterMode = "typstyle";
      };

      typst-vim = {
        enable = true;
        settings = {
          auto_open_quickfix = false;
          pdf_viewer = "zathura";
        };
      };
    };
  };
}
