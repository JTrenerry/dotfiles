{ pkgs, ... }:
{
  imports = [
    # TODO: more complex plugin configs should be a new file in this directory
    ./barbar.home.nix
    ./comment.home.nix
    ./floaterm.home.nix
    ./harpoon.home.nix
    ./lsp.home.nix
    ./lualine.home.nix
    ./markdown-preview.home.nix
    ./neorg.home.nix
    ./neo-tree.home.nix
    ./startify.home.nix
    ./tagbar.home.nix
    ./telescope.home.nix
    ./treesitter.home.nix
    ./vimtex.home.nix
  ];

  programs.nixvim = {

    colorschemes.rose-pine = {
      enable = true;
      settings = {
        variant = "moon";
      };
    };

    extraPlugins = [
      pkgs.vimPlugins."vim-loves-dafny"
      pkgs.vimPlugins."bracey-vim"
    ];
    plugins = {
      web-devicons.enable = true;

      # TODO: simple plugin configs can go here though
      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;

      colorizer = {
       enable = true;
      };

      oil.enable = true;

      trim = {
        enable = true;
        settings = {
          highlight = true;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lspinfo"
            "neo-tree"
            "TelescopePrompt"
          ];
        };
      };
    };
  };
}
