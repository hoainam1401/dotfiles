return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			transparent_background = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = "italic",
					hints = "italic",
					warnings = "italic",
					information = "italic",
					ok = "italic",
				},
				underlines = {
					errors = "underline",
					hints = "underline",
					warnings = "underline",
					information = "underline",
					ok = "underline",
				},
				intergrations = {
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
				},
			},
		})
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
