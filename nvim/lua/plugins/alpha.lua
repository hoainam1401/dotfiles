return {
	"goolord/alpha-nvim",
	lazy = true,
	event = "VimEnter",
	config = function()
		local status_ok, alpha = pcall(require, "alpha")
		if not status_ok then
			return
		end

		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			os.date("\t\t\t\t\t\t Today is %d(%A) of %B"),
		}
		dashboard.section.buttons.val = {
			dashboard.button("f", "📜  Find file", ":Telescope find_files <CR>"),
			dashboard.button("e", "📝 New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("r", "📉 Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("t", "🔍 Find text", ":Telescope live_grep <CR>"),
			dashboard.button("c", "🔥 Configuration", ":e ~/.config/nvim/init.vim<CR>"),
			dashboard.button("q", "💣 Quit Neovim", ":qa<CR>"),
		}

		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
