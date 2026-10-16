return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			integrations = {
				indent_blankline = {
					enabled = true,
					colored_indent_levels = false,
				},
				lualine = true,
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
