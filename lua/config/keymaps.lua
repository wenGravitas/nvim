-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to below window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- Switch to last buffer
vim.keymap.set("n", "<leader><leader>", "<C-^>", { desc = "Switch to last buffer" })

-- which-key
vim.keymap.set("n", "<leader>?", function()
  require("which-key").show("<leader>")
end, { desc = "Show which-key for <leader>" })

