return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local colors = {
			gray = "#313244",
			lightgray = "#585b70",
			orange = "#ffb86c",
			purple = "#cba6f7",
			red = "#f38ba8",
			yellow = "#f9e2af",
			green = "#a6e3a1",
			white = "#cdd6f4",
			black = "#11111b",
		}
		local my_lualine_theme = {
			normal = {
				a = { bg = colors.purple, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			insert = {
				a = { bg = colors.green, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			visual = {
				a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			replace = {
				a = { bg = colors.red, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			command = {
				a = { bg = colors.orange, fg = colors.black, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
			inactive = {
				a = { bg = colors.gray, fg = colors.white, gui = "bold" },
				b = { bg = colors.lightgray, fg = colors.white },
				c = { bg = colors.gray, fg = colors.white },
			},
		}

		local mode = {
			"mode",
			fmt = function(str)
				-- return ' '
				-- displays only the first character of the mode
				return " " .. str
			end,
		}

		local diff = {
			"diff",
			colored = true,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			-- cond = hide_in_width,
		}

		local filename = {
			"filename",
			file_status = true,
			path = 0,
		}

		local branch = { "branch", icon = { "", color = { fg = "#A6D4DE" } }, "|" }

		lualine.setup({
			icons_enabled = true,
			options = {
				theme = my_lualine_theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { branch },
				lualine_c = { diff, filename },
				lualine_x = {
					{
						-- require("noice").api.statusline.mode.get,
						-- cond = require("noice").api.statusline.mode.has,
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					-- { "encoding",},
					-- { "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
