local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.o.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
-- Install the Dracule Pro colorscheme: 
-- Step 1: Download the Vim folder 
-- Step 2: Rename it to dracula_pro and move it to .local/share/nvim/site/pack/themes/start/dracula_pro
-- Step 3: Add the following lines to your init.lua
-- Enable syntax highlighting
vim.cmd('syntax enable')
-- Set Dracula Pro colorterm option (0 = use your terminal's colors)
vim.g.dracula_colorterm = 0
-- Set the colorscheme
vim.cmd('colorscheme dracula_pro')
require("cmd-line")
require("floating-term")
require("vim-options")
require("lazy").setup("plugins")
