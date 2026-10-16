local servers = {
	clangd = {},
	jdtls = {},
	pyright = {},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
				workspace = { checkThirdParty = false },
			},
		},
	},
}

return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = vim.tbl_keys(servers),
			automatic_enable = false,
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			for name, config in pairs(servers) do
				config.capabilities = capabilities
				vim.lsp.config(name, config)
				vim.lsp.enable(name)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
				callback = function(event)
					local map = function(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
					end

					map("K", vim.lsp.buf.hover, "Show hover information")
					map("<leader>gd", vim.lsp.buf.definition, "Go to definition")
					map("<leader>gr", vim.lsp.buf.references, "Go to references")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action")
					map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
					map("<leader>gf", function()
						vim.lsp.buf.format({ async = true })
					end, "Format buffer")
				end,
			})
		end,
	},
}
