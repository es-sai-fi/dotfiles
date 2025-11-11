-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fh", function()
  require("snacks.picker").files({
    cwd = vim.fn.expand("~"),
  })
end, { desc = "Find Files (Home Dir)" })
