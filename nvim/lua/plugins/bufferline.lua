return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "DaikyXendo/nvim-material-icon",
  config = function()
    require("bufferline").setup({
      highlights = require("catppuccin.groups.integrations.bufferline").get(),
    })
  end,
}
