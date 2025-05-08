return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "xzbdmw/colorful-menu.nvim",
  },

  opts = {
    keymap = { preset = "super-tab" },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      menu = {
        window = {
          border = {
            { "┌", "FloatBorder" },
            { "─", "FloatBorder" },
            { "┐", "FloatBorder" },
            { "│", "FloatBorder" },
            { "┘", "FloatBorder" },
            { "─", "FloatBorder" },
            { "└", "FloatBorder" },
            { "│", "FloatBorder" },
          },
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
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
        window = {
          border = "rounded",
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
        },
        auto_show = false,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
  config = function(_, opts)
    require("colorful-menu").setup()
    require("blink.cmp").setup(opts)

    -- Muted FloatBorder
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#5c5c5c", bg = "#1e1e1e" })
  end,
}
