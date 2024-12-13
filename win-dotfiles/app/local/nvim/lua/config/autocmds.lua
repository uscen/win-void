-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------
-----------------------------------------------------------
-- Highlight on yank
-----------------------------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})
-----------------------------------------------------------
-- Disable auto comment
-----------------------------------------------------------
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions = { c = false, r = false, o = false }
	end,
})
-----------------------------------------------------------
-- Don't auto commenting new lines
-----------------------------------------------------------
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "",
	command = "set fo-=c fo-=r fo-=o",
})
-----------------------------------------------------------
-- Remove whitespace on save
-----------------------------------------------------------
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "",
	command = ":%s/\\s\\+$//e",
})
-----------------------------------------------------------
-- Restores cursor last position upon reopening the file
-----------------------------------------------------------
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})
-----------------------------------------------------------
-- Auto Enaple Oil Preview
-----------------------------------------------------------
vim.api.nvim_create_autocmd("User", {
	pattern = "OilEnter",
	callback = vim.schedule_wrap(function(args)
		local oil = require("oil")
		if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
			oil.open_preview()
		end
	end),
})
-----------------------------------------------------------
-- Automatically save a session when you exit Neovim
-----------------------------------------------------------
vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		-- Always save a special session named "last"
		require("resession").save("last")
	end,
})
-----------------------------------------------------------
-- Automatically save & Load Session
-----------------------------------------------------------
local save_fold = vim.api.nvim_create_augroup("Persistent Folds", { clear = true })
vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = "*.*",
	callback = function()
		vim.cmd.mkview()
	end,
	group = save_fold,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
	end,
	group = save_fold,
})
