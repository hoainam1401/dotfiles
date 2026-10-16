vim.g.mapleader = " "
vim.g.maplocalleader = " "

local python_host = vim.fn.expand("~/.nvim-python/bin/python")
if vim.fn.executable(python_host) == 1 then
	vim.g.python3_host_prog = python_host
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local output = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		error("Failed to install lazy.nvim:\n" .. output)
	end
end

vim.opt.rtp:prepend(lazypath)

require("cmd-line")
require("floating-term")
require("vim-options")
require("lazy").setup("plugins", {
	rocks = { enabled = false },
})
