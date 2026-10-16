local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.colorcolumn = "94"
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 400
opt.scrolloff = 4
opt.guicursor =
	"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- Move selected line / block of text in visual mode
vim.keymap.set("x", "J", ":move '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("x", "K", ":move '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("x", "<Tab>", ">gv", { desc = "Indent selection" })
vim.keymap.set("x", "<S-Tab>", "<gv", { desc = "Unindent selection" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostics" })
vim.keymap.set("n", "<leader>ce", function()
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
	if #diagnostics > 0 then
		local message = diagnostics[1].message
		vim.fn.setreg("+", message)
		vim.notify("Copied diagnostic: " .. message)
	else
		vim.notify("No diagnostic on this line", vim.log.levels.INFO)
	end
end, { desc = "Copy diagnostic to clipboard" })

vim.keymap.set("n", "<leader>ne", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "<leader>pe", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
