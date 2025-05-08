-- 0  = Black
-- 1  = DarkRed
-- 2  = DarkGreen
-- 3  = DarkYellow / Brown
-- 4  = DarkBlue
-- 5  = DarkMagenta
-- 6  = DarkCyan
-- 7  = LightGray / LightGrey (foreground default)

-- 8  = DarkGray / Gray (background default)
-- 9  = Red
-- 10 = Green
-- 11 = Yellow
-- 12 = Blue
-- 13 = Magenta
-- 14 = Cyan
-- 15 = White / BrightWhite
--
--

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

vim.api.nvim_set_hl(0, "Pmenu", {
  ctermbg = 233, -- black background
  ctermfg = 7, -- white/gray text
})

vim.api.nvim_set_hl(0, "PmenuSel", {
  ctermbg = 236, -- light background for selected item
  ctermfg = 7, -- black text
  bold = true,
})

vim.api.nvim_set_hl(0, "FloatBorder", {
  ctermfg = 7, -- light gray (white-ish)
  ctermbg = 0, -- black
})
