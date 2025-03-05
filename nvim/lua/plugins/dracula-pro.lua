return {
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
				white = "#F8F8F2",
				black = "#22212C",
			},
			transparent_bg = true,
			italic_comment = true,
		})
		vim.cmd.colorscheme("dracula")
	end,
}
