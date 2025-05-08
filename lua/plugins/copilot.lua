return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  lazy = false,
  build = ":Copilot auth",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>",
          next = "<C-]>",
          prev = "<C-[>",
          dismiss = "<Esc>",
        },
      },
      panel = { enabled = false }, -- don't show the side panel
      filetypes = {
        markdown = true,
        help = true,
        ["*"] = true,
      },
    })
  end,
}
