-- Enable persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- System clipboard
vim.opt.clipboard:append("unnamedplus")

-- Diagnostics
vim.opt.updatetime = 1000 -- time in ms before CursorHold triggers

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.termguicolors = false -- use 256-color terminal colors, not GUI colors

vim.api.nvim_set_hl(0, "FloatBorder", {
  ctermfg = 7, -- white (or try 15 for brighter white)
  ctermbg = 0, -- black
})

vim.api.nvim_set_hl(0, "LineNr", {
  ctermfg = 8, -- gray / dark gray in most terminals
})

vim.api.nvim_set_hl(0, "StatusLine", {
  ctermfg = 7, -- dark gray text
  ctermbg = 0, -- black background
})

vim.api.nvim_set_hl(0, "WinSeparator", {
  ctermfg = 8,
  ctermbg = 0,
})

vim.api.nvim_set_hl(0, "VertSplit", {
  ctermfg = 8, -- dark gray
  ctermbg = 0, -- black background
})

vim.opt.cmdheight = 1
