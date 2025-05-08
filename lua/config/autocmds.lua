vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    local wins = vim.api.nvim_list_wins()
    local ft = vim.bo[vim.api.nvim_get_current_buf()].filetype
    if #wins == 1 and ft == "NvimTree" then
      vim.cmd("quit")
    end
  end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.relativenumber = true
  end,
})
