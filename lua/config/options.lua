-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- System clipboard
vim.opt.clipboard:append("unnamedplus")

-- Diagnostics
vim.opt.updatetime = 1000 -- time in ms before CursorHold triggers

vim.opt.number = true
vim.opt.relativenumber = true
