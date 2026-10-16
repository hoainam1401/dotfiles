return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"jonarrien/telescope-cmdline.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")

			telescope.setup({
				extensions = {
					["ui-select"] = require("telescope.themes").get_dropdown({}),
				},
			})
			telescope.load_extension("cmdline")
			telescope.load_extension("ui-select")

			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find in files" })
			vim.keymap.set("n", "Q", "<cmd>Telescope cmdline<CR>", { desc = "Command history" })
			vim.keymap.set("n", "<leader><leader>", "<cmd>Telescope cmdline<CR>", { desc = "Command history" })
		end,
	},
}
