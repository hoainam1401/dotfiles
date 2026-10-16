return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "catppuccin/nvim", "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = require("catppuccin.palettes").get_palette("mocha")
		local lazy_status = require("lazy.status")

		local theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.crust, gui = "bold" },
				b = { bg = colors.surface0, fg = colors.blue },
				c = { bg = colors.mantle, fg = colors.text },
			},
			insert = { a = { bg = colors.green, fg = colors.crust, gui = "bold" } },
			visual = { a = { bg = colors.mauve, fg = colors.crust, gui = "bold" } },
			replace = { a = { bg = colors.red, fg = colors.crust, gui = "bold" } },
			command = { a = { bg = colors.peach, fg = colors.crust, gui = "bold" } },
			inactive = {
				a = { bg = colors.mantle, fg = colors.overlay0 },
				b = { bg = colors.mantle, fg = colors.overlay0 },
				c = { bg = colors.mantle, fg = colors.overlay0 },
			},
		}

		local mode_names = {
			n = "NORMAL",
			no = "O-PENDING",
			i = "INSERT",
			ic = "INSERT",
			v = "VISUAL",
			V = "V-LINE",
			["\22"] = "V-BLOCK",
			R = "REPLACE",
			Rv = "V-REPLACE",
			c = "COMMAND",
			cv = "VIM EX",
			ce = "EX",
			s = "SELECT",
			S = "S-LINE",
			["\19"] = "S-BLOCK",
			t = "TERMINAL",
		}

		local function lsp_name()
			local clients
			if vim.lsp.get_clients then
				clients = vim.lsp.get_clients({ bufnr = 0 })
			else
				clients = vim.lsp.get_active_clients({ bufnr = 0 })
			end

			if #clients == 0 then
				return "No LSP"
			end

			local names = {}
			for _, client in ipairs(clients) do
				if client.name ~= "null-ls" then
					table.insert(names, client.name)
				end
			end
			return #names > 0 and table.concat(names, ", ") or "No LSP"
		end

		require("lualine").setup({
			options = {
				theme = theme,
				icons_enabled = true,
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = { "alpha", "dashboard", "snacks_dashboard" },
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = "",
						fmt = function()
							return mode_names[vim.fn.mode()] or "VIM"
						end,
					},
				},
				lualine_b = {
					{ "branch", icon = "" },
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						diff_color = {
							added = { fg = colors.green },
							modified = { fg = colors.yellow },
							removed = { fg = colors.red },
						},
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true,
						newfile_status = true,
						path = 1,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = " [No Name]",
							newfile = " [New]",
						},
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						icon = "󰏗 ",
						color = { fg = colors.peach },
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
						diagnostics_color = {
							error = { fg = colors.red },
							warn = { fg = colors.yellow },
							info = { fg = colors.sky },
							hint = { fg = colors.teal },
						},
					},
					{ lsp_name, icon = " ", color = { fg = colors.mauve } },
					{ "filetype", colored = true },
				},
				lualine_y = {
					{ "progress", icon = "󰦨" },
				},
				lualine_z = {
					{ "location", icon = "" },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
