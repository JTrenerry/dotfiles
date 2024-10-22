{pkgs, ...}: {
  programs = {
    nixvim = {
      extraPackages = with pkgs; [
      ];
      plugins = {
        lsp.servers.nil_ls.enable = true;
        lsp-format.lspServersToEnable = ["nil_ls"];
        nix.enable = true;
      };
    };
  };
}
