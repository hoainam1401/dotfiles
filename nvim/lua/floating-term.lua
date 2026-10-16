local state = { buf = -1, win = -1 }

local function create_floating_window(buf)
	local width = math.max(1, math.floor(vim.o.columns * 0.8))
	local height = math.max(1, math.floor((vim.o.lines - vim.o.cmdheight) * 0.8))

	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	if not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_create_buf(false, true)
	end

	local config = {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	}
	local win = vim.api.nvim_open_win(buf, true, config)
	vim.wo[win].winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"
	return { buf = buf, win = win }
end

local function toggle_terminal()
	if not vim.api.nvim_win_is_valid(state.win) then
		state = create_floating_window(state.buf)
		if vim.bo[state.buf].buftype ~= "terminal" then
			vim.cmd.terminal()
		end
		vim.cmd.startinsert()
	else
		vim.api.nvim_win_hide(state.win)
	end
end

vim.api.nvim_create_user_command("FTerm", toggle_terminal, { desc = "Toggle floating terminal" })
vim.keymap.set("n", "<leader>tt", toggle_terminal, { desc = "Toggle floating terminal" })
