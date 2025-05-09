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

-- Hide highlight
vim.keymap.set(
  "n",
  "<Leader>H",
  ":set hlsearch!<CR>",
  { noremap = true, silent = true, desc = "Toggle search highlight" }
)

-- which-key
vim.keymap.set("n", "<leader>?", function()
  require("which-key").show("<leader>")
end, { desc = "Show which-key for <leader>" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope codecompanion<CR>", { desc = "Code Companion Action Pallete" })

vim.api.nvim_create_user_command("EditConfig", function()
  vim.cmd("cd ~/.config/nvim")
  require("telescope.builtin").find_files({ cwd = "~/.config/nvim" })
end, {})

vim.keymap.set("n", "<leader>rr", function()
  for name, _ in pairs(package.loaded) do
    if name:match("^user") or name:match("^plugins") or name:match("^config") then
      package.loaded[name] = nil
    end
  end

  dofile(vim.fn.stdpath("config") .. "/init.lua")
  vim.notify("Config reloaded!", vim.log.levels.INFO)
end, { desc = "Reload Neovim config" })

vim.keymap.set("n", "<leader>ri", "<cmd>EditConfig<CR>", { desc = "Edit Neovim config" })
