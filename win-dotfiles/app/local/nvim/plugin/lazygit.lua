--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Toggle Lazygit                      ║
--          ╚═════════════════════════════════════════════════════════╝
local group = vim.api.nvim_create_augroup("LazygitClose", { clear = true })
vim.api.nvim_create_autocmd("TermClose", {
  group = group,
  pattern = { "term://*lazygit" },
  callback = function()
    vim.api.nvim_input("<CR>")
  end,
})

vim.keymap.set({ "n", "t" }, "<leader>gg", function()
  vim.api.nvim_set_hl(0, "TerminalFloatBG", { bg = "#151515", fg = "#E3E3E3" })
  vim.api.nvim_set_hl(0, "TerminalFloatBorder", { bg = "#151515", fg = "#8C977D" })
  vim.cmd("split | terminal lazygit")
  local buf = vim.api.nvim_get_current_buf()
  vim.opt_local.buflisted = false
  vim.api.nvim_win_close(vim.api.nvim_get_current_win(), true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = math.floor(vim.o.columns * 0.8),
    height = math.floor(vim.o.lines * 0.8),
    row = math.floor(vim.o.lines * 0.1),
    col = math.floor(vim.o.columns * 0.1),
    style = 'minimal',
    border = 'single',
  })
  vim.wo[win].winhl = 'Normal:TerminalFloatBG,FloatBorder:TerminalFloatBorder'
  vim.cmd("startinsert")
end, { desc = "Open Float Lazygit" })
