return {
	"binhtran432k/dracula.nvim",
	name = "dracula",
	lazy = false,
	priority = 1000,
	config = function()
		require("dracula").setup({
			transparent = true,
		})
		vim.cmd.colorscheme("dracula")
	end,
}
