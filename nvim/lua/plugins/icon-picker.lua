return {
	"ziontee113/icon-picker.nvim",
	config = function()
		require("icon-picker").setup({ disable_legacy_commands = true })

		vim.keymap.set("n", "<leader>ip", "<cmd>IconPickerNormal<CR>", { desc = "Pick icon" })
		vim.keymap.set("n", "<leader>yp", "<cmd>IconPickerYank<CR>", { desc = "Yank icon" })
		vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<CR>", { desc = "Insert icon" })
	end,
}
