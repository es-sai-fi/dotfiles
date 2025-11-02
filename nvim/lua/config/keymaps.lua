-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>fh", function()
  require("snacks.picker").files({
    cwd = vim.fn.expand("~"),
  })
end, { desc = "Find Files (Home Dir)" })

-- Marks
vim.keymap.set("n", "<leader>ma", function()
  vim.cmd("argadd %")
  vim.cmd("argdedup")
  vim.notify("Added mark")
end, { desc = "Add mark" })

for i = 1, 9 do
  vim.keymap.set("n", "<leader>md" .. i, function()
    local file = vim.fn.argv(i - 1)
    vim.cmd("argdelete " .. vim.fn.fnameescape(file))
    vim.notify("Removed marked file #" .. i)
  end, { desc = "Delete mark #" .. i })
end

vim.keymap.set("n", "<leader>ms", function()
  local args = vim.fn.argv()
  if #args == 0 then
    vim.notify("No marks yet", vim.log.levels.INFO)
    return
  end

  local list = {}
  for i, file in ipairs(args) do
    table.insert(list, string.format("%d. %s", i, file))
  end

  vim.notify(table.concat(list, "\n"), vim.log.levels.INFO, { title = "Marked files" })
end, { desc = "Show marks" })

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    vim.cmd("silent! " .. i .. "argument")
  end, { desc = "which_key_ignore" })
end
