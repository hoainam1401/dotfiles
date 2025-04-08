return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 900,
    config = function()
      -- Set default theme
      local themes = {
        "catppuccin",
        "dracula",
      }

      local current_theme_index = 1
      -- Set default theme (first theme)
      vim.cmd.colorscheme(themes[current_theme_index])

      -- Key mapping to switch themes (e.g., <leader>nt)
      vim.keymap.set("n", "<leader>nt", function()
        current_theme_index = current_theme_index + 1
        if current_theme_index > #themes then
          current_theme_index = 1
        end
        local theme = themes[current_theme_index]
        vim.cmd.colorscheme(theme)
        print("Change nvim theme to: " .. theme)
      end, { noremap = true, silent = true, desc = "Change nvim theme" })
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup({
        colors = {
          bg = "#22212C",
          fg = "#F8F8F2",
          selection = "#454158",
          comment = "#7970A9",
          red = "#FF9580",
          orange = "#FFCA80",
          yellow = "#FFFF80",
          green = "#8AFF80",
          purple = "#9580FF",
          cyan = "#80FFEA",
          pink = "#FF80BF",
          bright_red = "#FFAA99",
          bright_green = "#A2FF99",
          bright_yellow = "#FFFF99",
          bright_blue = "#AA99FF",
          bright_magenta = "#FF99CC",
          bright_cyan = "#99FFEE",
          bright_white = "#FFFFFF",
          menu = "#21222C",
          visual = "#3E4452",
          gutter_fg = "#4B5263",
          nontext = "#3B4048",
          white = "#ABB2BF",
          black = "#191A21",
        },
        italic_comment = true,
        show_end_of_buffer = true,
      })
      vim.cmd.colorscheme("dracula")
    end,
  },
}
