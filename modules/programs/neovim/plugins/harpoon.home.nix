{
  programs.nixvim = {
    keymaps = [
           { mode = "n"; key = "<leader>a"; action.__raw = "function() require'harpoon':list():add() end"; }
           { mode = "n"; key = "<C-e>"; action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
           { mode = "n"; key = "<C-j>"; action.__raw = "function() require'harpoon':list():select(1) end"; }
           { mode = "n"; key = "<C-k>"; action.__raw = "function() require'harpoon':list():select(2) end"; }
           { mode = "n"; key = "<C-l>"; action.__raw = "function() require'harpoon':list():select(3) end"; }
           { mode = "n"; key = "<C-m>"; action.__raw = "function() require'harpoon':list():select(4) end"; }
    ];

    plugins.harpoon = {
      enable = true;
    };
  };
}
