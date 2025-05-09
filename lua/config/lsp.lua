vim.lsp.enable("lua_ls")
vim.lsp.enable("tsserver")
vim.lsp.set_log_level("debug")

vim.lsp.config("*", {
  on_attach = function(client, bufnr)
    local bufmap = function(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
    end

    bufmap("n", "K", vim.lsp.buf.hover, "Hover Documentation")
    bufmap("n", "gd", vim.lsp.buf.definition, "Go to Definition")
    bufmap("n", "gr", vim.lsp.buf.references, "Find References")
    bufmap("n", "gi", vim.lsp.buf.implementation, "Go to Implementation")
    bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
    bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
  end,
})
vim.diagnostic.config({
  virtual_text = false, -- you can set this to true if you want inline text as well
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})
