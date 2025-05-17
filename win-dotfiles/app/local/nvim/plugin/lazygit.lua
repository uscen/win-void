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

vim.keymap.set({ "n", "t" }, "<leader>gg", (function()
  local buf, win = nil, nil
  local was_insert = true
  local cfg = function()
    return {
      relative = 'editor',
      width = math.floor(vim.o.columns * 0.8),
      height = math.floor(vim.o.lines * 0.8),
      row = math.floor(vim.o.lines * 0.1),
      col = math.floor(vim.o.columns * 0.1),
      style = 'minimal',
      border = 'single',
    }
  end
  return function()
    buf = (buf and vim.api.nvim_buf_is_valid(buf)) and buf or nil
    win = (win and vim.api.nvim_win_is_valid(win)) and win or nil
    if not buf and not win then
      vim.cmd("split | terminal lazygit")
      buf = vim.api.nvim_get_current_buf()
      vim.opt_local.buflisted = false
      vim.api.nvim_win_close(vim.api.nvim_get_current_win(), true)
      win = vim.api.nvim_open_win(buf, true, cfg())
    elseif not win and buf then
      win = vim.api.nvim_open_win(buf, true, cfg())
    elseif win then
      was_insert = vim.api.nvim_get_mode().mode == "t"
      return vim.api.nvim_win_close(win, true)
    end
    if was_insert then vim.cmd("startinsert") end
  end
end)(), { desc = "Toggle Float Lazygit" })
