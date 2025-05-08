return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    -- Utility: get active LSP client
    local function lsp_name()
      local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
      if #buf_clients == 0 then
        return "no LSP"
      end
      return buf_clients[1].name or "LSP"
    end

    return {
      options = {
        theme = "auto",
        icons_enabled = true,
        component_separators = " ",
        section_separators = " ",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename" },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = "E:", warn = "W:" },
            colored = false,
          },
          {
            lsp_name,
            icon = "", -- You can remove this if you hate symbols
          },
          "filetype",
        },
        lualine_y = {
          {
            function()
              return vim.o.paste and "PASTE" or ""
            end,
            color = { fg = "red" },
          },
          {
            function()
              local rec = vim.fn.reg_recording()
              return rec ~= "" and "REC " .. rec or ""
            end,
            color = { fg = "yellow" },
          },
        },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
  init = function()
    -- Muted style for terminal users
    local hl = vim.api.nvim_set_hl
    hl(0, "lualine_a_normal", { ctermfg = 7, ctermbg = 0 })
    hl(0, "lualine_b_normal", { ctermfg = 8, ctermbg = 0 })
    hl(0, "lualine_c_normal", { ctermfg = 8, ctermbg = 0 })
    hl(0, "lualine_x_normal", { ctermfg = 8, ctermbg = 0 })
    hl(0, "lualine_z_normal", { ctermfg = 8, ctermbg = 0 })
    hl(0, "lualine_c_inactive", { ctermfg = 8, ctermbg = 0 })
  end,
}
