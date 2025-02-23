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
-- set insert mode when focusing on terminal window
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "term://*",
  callback = function()
    vim.cmd("startinsert")
  end,
})
-- Hide Tabline When Only One Open
vim.api.nvim_create_autocmd('BufEnter', {
  callback = vim.schedule_wrap(function()
    local n_listed_bufs = 0
    for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
      if vim.fn.buflisted(buf_id) == 1 then n_listed_bufs = n_listed_bufs + 1 end
    end
    -- Use either approach: first (commented) directly hides tabline while second makes it blank
    vim.o.showtabline = n_listed_bufs > 1 and 2 or 0
    -- vim.o.tabline = n_listed_bufs > 1 and '%!v:lua.MiniTabline.make_tabline_string()' or ' '
  end),
  desc = 'Update tabline based on the number of listed buffers',
})
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
