return {
	{
		"lukas-reineke/virt-column.nvim",
		opts = {
			char = "┊",
			virtcolumn = "94",
			highlight = "WarningMsg",
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		dependencies = { "HiPhish/rainbow-delimiters.nvim" },
		config = function()
			local highlight = {
				"RainbowGreen",
				"RainbowViolet",
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowCyan",
			}
			local colors = {
				RainbowGreen = "#A6E3A1",
				RainbowViolet = "#CBA6F7",
				RainbowRed = "#F38BA8",
				RainbowYellow = "#F9E2AF",
				RainbowBlue = "#89B4FA",
				RainbowOrange = "#FAB387",
				RainbowCyan = "#89DCEB",
			}
			local hooks = require("ibl.hooks")

			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				for group, color in pairs(colors) do
					vim.api.nvim_set_hl(0, group, { fg = color })
				end
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
