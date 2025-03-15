return {
	"Mofiqul/dracula.nvim",
	name = "alucard",
	lazy = false,
	priority = 1000,
	config = function()
		require("dracula").setup({
			colors = {
				bg = "#F5F5F5",
				fg = "#1F1F1F",
				selection = "#CFCFDE",
				comment = "#635D97",
				red = "#CB3A2A",
				orange = "#A34D14",
				yellow = "#846E15",
				green = "#14710A",
				purple = "#644AC9",
				cyan = "#036A96",
				pink = "#A3144D",
				bright_red = "#D74C3D",
				bright_green = "#198D0C",
				bright_yellow = "#9E841A",
				bright_blue = "#7862D0",
				bright_magenta = "#BF185A",
				bright_cyan = "#047FB4",
				bright_white = "#2C2B31",
				menu = "#FFFFFF",
				visual = "#BD93F9",
				gutter_fg = "#F8F8F2",
				nontext = "#C4C4C4",
				white = "#1F1F1F",
				black = "#F5F5F5",
			},
			italic_comment = true,
			show_end_of_buffer = true,
		})
		vim.cmd.colorscheme("dracula")
	end,
}
