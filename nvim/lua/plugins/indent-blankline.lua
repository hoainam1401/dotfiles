return {
	{
		"lukas-reineke/virt-column.nvim",
		opts = {
			char = "┊",
			virtcolumn = "94",
			hihlight = "WarningMsg",
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			local indent_blankline = vim.api.nvim_create_augroup("inndent_blankline_augroup", { clear = true })
			local highlight = {
        "RainbowGreen",
        "RainbowViolet",
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowCyan",
			}
			local hooks = require("ibl.hooks")

			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#A6E3A1" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#CBA6F7" })
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#F38BA8" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#F9E2AF" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89B4FA" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FAB387" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#89DCEB" })
			end)
			vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup({
				scope = {
					highlight = highlight,
					show_start = false,
					show_end = false,
				},
			})

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
}
