return {
	"maxmx03/dracula.nvim",
	name = "dracula",
	lazy = false,
	priority = 1000,
	config = function()
		require("dracula").setup({
			colors = {
				bg = "#F5F5F5",
				fg = "#1F1F1F",
				selection = "#CFCFDE",
				comment = "#635D97",
				red = "#FF5555",
				orange = "#CB3A2A",
				yellow = "#846E15",
				green = "#14710A",
				purple = "#A3144D",
				cyan = "#036A96",
				pink = "#644AC9",
				bright_red = "#D74C3D",
				bright_green = "#198D0C",
				bright_yellow = "#9E841A",
				bright_blue = "#7862D0",
				bright_magenta = "#BF185A",
				bright_cyan = "#047FB4",
				bright_white = "#2C2B31",
				menu = "#f8f8f2",
				visual = "#9580ff",
				gutter_fg = "#4B5263",
				nontext = "#3B4048",
				white = "#1F1F1F",
				black = "#F5F5F5",
			},
			transparent_bg = false,
      italic_coment = true,
		})
		vim.cmd.colorscheme("dracula-soft")
	end,
}
