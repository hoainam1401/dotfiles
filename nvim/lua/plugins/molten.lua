return {
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		lazy = false,
		build = ":UpdateRemotePlugins",
		init = function()
			-- Output window settings
			vim.g.molten_output_win_max_height = 20
			vim.g.molten_auto_open_output = true
			vim.g.molten_wrap_output = true
			vim.g.molten_virt_text_output = true
			vim.g.molten_virt_lines_off_by_1 = true

			-- Save images to file and open with system viewer
			vim.g.molten_image_provider = "none"
			vim.g.molten_output_show_more = true

			-- Match output borders to the active colorscheme.
			vim.g.molten_use_border_highlights = true
		end,
		config = function()
			vim.keymap.set("n", "<leader>mi", "<cmd>MoltenInit python3<CR>", { desc = "Molten Init" })
			vim.keymap.set("n", "<leader>me", "<cmd>MoltenEvaluateOperator<CR>", { desc = "Molten Evaluate Operator" })
			vim.keymap.set("n", "<leader>ml", "<cmd>MoltenEvaluateLine<CR>", { desc = "Molten Evaluate Line" })
			vim.keymap.set(
				"x",
				"<leader>mv",
				":<C-u>MoltenEvaluateVisual<CR>",
				{ desc = "Molten Evaluate Visual", silent = true }
			)
			vim.keymap.set(
				"x",
				"<leader>mc",
				":<C-u>MoltenEvaluateVisual<CR>",
				{ desc = "Molten Run Cell (Visual)", silent = true }
			)
			vim.keymap.set("n", "<leader>mr", "<cmd>MoltenReevaluateCell<CR>", { desc = "Molten Re-evaluate Cell" })
			vim.keymap.set("n", "<leader>mo", "<cmd>MoltenShowOutput<CR>", { desc = "Molten Show Output" })
			vim.keymap.set("n", "<leader>mh", "<cmd>MoltenHideOutput<CR>", { desc = "Molten Hide Output" })
			vim.keymap.set("n", "<leader>md", "<cmd>MoltenDelete<CR>", { desc = "Molten Delete Cell" })

			-- Run cell (code between # %% markers, like Jupyter/VSCode)
			vim.keymap.set("n", "<leader>mc", function()
				local start_line = vim.fn.search("^# %%", "bnW")
				if start_line == 0 then
					start_line = 1
				else
					start_line = start_line + 1
				end
				local end_line = vim.fn.search("^# %%", "nW")
				if end_line == 0 then
					end_line = vim.fn.line("$")
				else
					end_line = end_line - 1
				end
				vim.fn.MoltenEvaluateRange(start_line, end_line)
			end, { desc = "Molten Run Cell", silent = true })

			-- Navigate cells
			vim.keymap.set("n", "<leader>mn", function()
				vim.fn.search("^# %%", "W")
			end, { desc = "Next cell" })
			vim.keymap.set("n", "<leader>mp", function()
				vim.fn.search("^# %%", "bW")
			end, { desc = "Previous cell" })
		end,
	},
	{
		"GCBallesteros/jupytext.nvim",
		config = function()
			require("jupytext").setup({
				style = "percent",
				output_extension = "auto",
				force_ft = "python",
			})
		end,
	},
	{
		"quarto-dev/quarto-nvim",
		dependencies = {
			"jmbuhr/otter.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		ft = { "quarto", "markdown", "r", "rmd" },
		config = function()
			local quarto = require("quarto")
			quarto.setup({
				debug = false,
				closePreviewOnExit = true,
				lspFeatures = {
					enabled = true,
					chunks = "curly",
					languages = { "r", "python", "julia", "bash", "html" },
					diagnostics = {
						enabled = true,
						triggers = { "BufWritePost" },
					},
					completion = {
						enabled = true,
					},
				},
				codeRunner = {
					enabled = true,
					default_method = "molten",
					ft_runners = {
						r = "molten",
					},
					never_run = { "yaml" },
				},
			})

			-- Quarto keymaps
			vim.keymap.set("n", "<leader>qa", quarto.activate, { desc = "Quarto Activate" })
			vim.keymap.set("n", "<leader>qp", quarto.quartoPreview, { desc = "Quarto Preview" })
			vim.keymap.set("n", "<leader>qq", quarto.quartoClosePreview, { desc = "Quarto Close Preview" })

			-- Run code with quarto runner (uses Molten)
			local runner = require("quarto.runner")
			vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "Run Cell", silent = true })
			vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "Run Cell and Above", silent = true })
			vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "Run All Cells", silent = true })
			vim.keymap.set("n", "<leader>rl", runner.run_line, { desc = "Run Line", silent = true })
			vim.keymap.set("x", "<leader>r", runner.run_range, { desc = "Run Visual Range", silent = true })
		end,
	},
	{
		"jmbuhr/otter.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
	},
}
