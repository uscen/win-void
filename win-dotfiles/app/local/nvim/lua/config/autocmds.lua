-----------------------------------------------------------
-- Autocommand:
-----------------------------------------------------------
-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
-- Don't Comment New Line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})
-- Toggle Oil File Manager
vim.api.nvim_create_user_command("OilToggle", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_filetype = vim.api.nvim_buf_get_option(current_buf, "filetype")
  if current_filetype == "oil" then
    vim.cmd("b#")
  else
    vim.cmd("Oil --preview")
  end
end, { nargs = 0 })
-----------------------------------------------------------
-- function
-----------------------------------------------------------
-- Toggle Terminal:
local te_buf = nil
local te_win_id = nil
ToggleTerminal = function()
  if vim.fn.win_gotoid(te_win_id) == 1 then
    if vim.fn.win_gotoid(te_win_id) == 1 then
      vim.api.nvim_command("hide")
    end
  else
    if vim.fn.bufexists(te_buf) ~= 1 then
      vim.api.nvim_command("au TermOpen * setlocal nobuflisted nonumber norelativenumber signcolumn=no")
      vim.api.nvim_command("sp | winc J | res 15 | te")
      te_win_id = vim.fn.win_getid()
      te_buf = vim.fn.bufnr('%')
    elseif vim.fn.win_gotoid(te_win_id) ~= 1 then
      vim.api.nvim_command("sb " .. te_buf .. "| winc J | res 15")
      te_win_id = vim.fn.win_getid()
    end
    vim.api.nvim_command("startinsert")
  end
end
-- Close other buffers except current one.
CloseAllButCurrent = function()
  local current_buf = vim.fn.bufnr()
  local current_win = vim.fn.win_getid()
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  for _, buf in ipairs(bufs) do
    if buf.bufnr ~= current_buf then
      vim.cmd("silent! bdelete " .. buf.bufnr)
    end
  end
  vim.fn.win_gotoid(current_win)
end
