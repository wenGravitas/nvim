vim.lsp.enable("lua_ls")

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
