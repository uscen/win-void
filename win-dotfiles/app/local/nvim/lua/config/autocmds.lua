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
-- Don't Comment New Line
-----------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})
-----------------------------------------------------------
-- Oil File Manager
-----------------------------------------------------------
-- Create Oil Toggle
vim.api.nvim_create_user_command("OilToggle", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_filetype = vim.api.nvim_buf_get_option(current_buf, "filetype")

  if current_filetype == "oil" then
    -- We use a command to go to the previous buffer
    vim.cmd("b#")
  else
    -- Open oil if not already in an oil buffer
    vim.cmd("Oil")
  end
end, { nargs = 0 })
-----------------------------------------------------------
-- Toggle Terminal
-----------------------------------------------------------
local te_buf = nil
local te_win_id = nil

local v = vim
local fun = v.fn
local cmd = v.api.nvim_command
local gotoid = fun.win_gotoid
local getid = fun.win_getid

local function openTerminal()
  if fun.bufexists(te_buf) ~= 1 then
    cmd("au TermOpen * setlocal nonumber norelativenumber signcolumn=no")
    cmd("sp | winc J | res 10 | te")
    te_win_id = getid()
    te_buf = fun.bufnr('%')
  elseif gotoid(te_win_id) ~= 1 then
    cmd("sb " .. te_buf .. "| winc J | res 10")
    te_win_id = getid()
  end
  cmd("startinsert")
end

local function hideTerminal()
  if gotoid(te_win_id) == 1 then
    cmd("hide")
  end
end

function ToggleTerminal()
  if gotoid(te_win_id) == 1 then
    hideTerminal()
  else
    openTerminal()
  end
end
