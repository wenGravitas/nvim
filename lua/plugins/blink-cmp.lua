return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "xzbdmw/colorful-menu.nvim",
    "giuxtaposition/blink-cmp-copilot",
    "Kaiser-Yang/blink-cmp-avante",
  },

  opts = {
    keymap = {
      preset = nil, -- disable built-in presets
      custom = {
        ["<Tab>"] = function()
          local copilot = require("copilot.suggestion")
          local luasnip = require("luasnip")

          if copilot.is_visible() then
            copilot.accept()
          elseif vim.fn.pumvisible() == 1 then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, false, true), "n", true)
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
          end
        end,

        ["<S-Tab>"] = function()
          local luasnip = require("luasnip")
          if vim.fn.pumvisible() == 1 then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, false, true), "n", true)
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", true)
          end
        end,
      },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = {
      menu = {
        draw = {
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
      documentation = {
        auto_show = false,
      },
    },

    sources = {
      default = { "avante", "lsp", "path", "snippets", "buffer" },
      providers = {
        avante = {
          module = "blink-cmp-avante",
          name = "Avante",
          opts = {
            -- options for blink-cmp-avante
          },
        },
      },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },

  opts_extend = { "sources.default" },

  config = function(_, opts)
    require("colorful-menu").setup()
    require("blink.cmp").setup(opts)

    -- Muted FloatBorder for popup windows
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5c5c5c", bg = "#1e1e1e" })
  end,
}
