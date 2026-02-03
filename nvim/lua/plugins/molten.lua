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

			-- Disable image provider (Ghostty doesn't support inline images well)
			vim.g.molten_image_provider = "none"
		end,
		config = function()
			vim.keymap.set("n", "<space>mi", "<cmd>MoltenInit python3<cr>", { desc = "Molten Init" })
			vim.keymap.set("n", "<space>me", "<cmd>MoltenEvaluateOperator<cr>", { desc = "Molten Evaluate Operator" })
			vim.keymap.set("n", "<space>ml", "<cmd>MoltenEvaluateLine<cr>", { desc = "Molten Evaluate Line" })
			vim.keymap.set(
				"v",
				"<space>mv",
				":<C-u>MoltenEvaluateVisual<cr>",
				{ desc = "Molten Evaluate Visual", silent = true }
			)
			vim.keymap.set("n", "<space>mr", "<cmd>MoltenReevaluateCell<cr>", { desc = "Molten Re-evaluate Cell" })
			vim.keymap.set("n", "<space>mo", "<cmd>MoltenShowOutput<cr>", { desc = "Molten Show Output" })
			vim.keymap.set("n", "<space>mh", "<cmd>MoltenHideOutput<cr>", { desc = "Molten Hide Output" })
			vim.keymap.set("n", "<space>md", "<cmd>MoltenDelete<cr>", { desc = "Molten Delete Cell" })

			-- Run cell (code between # %% markers, like Jupyter/VSCode)
			vim.keymap.set("n", "<space>mc", function()
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
			vim.keymap.set("n", "<space>mn", function()
				vim.fn.search("^# %%", "W")
			end, { desc = "Next cell" })
			vim.keymap.set("n", "<space>mp", function()
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
}
