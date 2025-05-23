return {
	"stevearc/oil.nvim",
	dependencies = {
		"DaikyXendo/nvim-material-icon",
	},
	config = function()
		local oil = require("oil")
		oil.setup({
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = false,
			columns = { "icon" },
			view_options = {
				show_hidden = true,
				is_always_hidden = function(name, _)
					return name == ".." or name == ".git"
				end,
			},
			win_options = {
				wrap = true,
				cursorcolumn = false,
			},
			watch_for_changes = true,
			use_default_keymaps = true,
		})
		vim.keymap.set("n", "-", oil.toggle_float, { desc = "Toggle float oil" })
	end,
}
