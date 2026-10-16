return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		if not vim.g._treesitter_get_node_text_compat then
			local get_node_text = vim.treesitter.get_node_text
			vim.treesitter.get_node_text = function(node, source, opts)
				if type(node) == "table" then
					node = node[1]
				end
				if not node then
					return ""
				end
				return get_node_text(node, source, opts)
			end
			vim.g._treesitter_get_node_text_compat = true
		end

		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"diff",
				"html",
				"javascript",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			ignore_install = { "latex" },
			highlight = { enable = true },
			indent = { enable = true },
			auto_install = false,
		})
	end,
}
