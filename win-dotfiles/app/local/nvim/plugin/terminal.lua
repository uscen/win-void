--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Toggle Terminal                     ║
--          ╚═════════════════════════════════════════════════════════╝
local M = {}
local au = function(event, pattern, opts)
  opts = opts or {}
  vim.api.nvim_create_autocmd(
    event,
    vim.tbl_extend("force", opts, {
      pattern = pattern,
    })
  )
end
M.state = {
  data = {
    buf_id = -1,
    win_id = -1,
  },
  window = function()
    local current_columns = vim.o.columns
    local current_lines = vim.o.lines

    local width = math.floor(current_columns * 0.8)
    local height = math.floor(current_lines * 0.8)
    local col = math.floor(0.8 * (current_columns - width) / 2)
    local row = math.floor((current_lines - height) / 2)
    return {
      title = "Terminal",
      relative = "editor",
      title_pos = "left",
      width = width,
      height = height,
      col = col,
      row = row,
      style = "minimal",
      border = "double",
      zindex = 5,
    }
  end,
}
local TerminalFloat = vim.api.nvim_create_augroup("TerminalResize", { clear = true })
M.resize = function()
  if M.state.data.win_id == nil or not vim.api.nvim_win_is_valid(M.state.data.win_id) then return end

  local current_columns = vim.o.columns
  local current_lines = vim.o.lines

  local window_config = M.state.window()
  vim.api.nvim_win_set_config(M.state.data.win_id, window_config)

  if vim.api.nvim_win_is_valid(M.state.data.overlay_win) then
    local overlay_config = {
      width = current_columns,
      height = current_lines,
    }
    vim.api.nvim_win_set_config(M.state.data.overlay_win, overlay_config)
  end

  vim.cmd([[redraw!]])
end

M.winbuf = function(opts)
  opts = opts or {}
  vim.schedule(function() vim.api.nvim_exec_autocmds("User", { pattern = "TerminalPro" }) end)
  local overlay_buf = vim.api.nvim_create_buf(false, true)
  vim.bo[overlay_buf].bufhidden = "wipe"

  local overlay_opts = {
    style = "minimal",
    relative = "win",
    width = vim.o.columns,
    height = vim.o.lines,
    row = 0,
    col = 0,
    focusable = false,
    zindex = 1,
  }
  local overlay_win = vim.api.nvim_open_win(overlay_buf, false, overlay_opts)
  vim.wo[overlay_win].winblend = 60
  vim.wo[overlay_win]["winhighlight"] = "Normal:BLACK"

  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf_id) then
    buf = opts.buf_id
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_cfg = M.state.window()
  local win = vim.api.nvim_open_win(buf, true, win_cfg)

  return { buf_id = buf, win_id = win, overlay_win = overlay_win }
end
M.winbuf_toggle = function()
  if not vim.api.nvim_win_is_valid(M.state.data.win_id) then
    M.state.data = M.winbuf { buf_id = M.state.data.buf_id }
    if vim.bo[M.state.data.buf_id].buftype ~= "terminal" then vim.cmd.terminal() end
    vim.cmd("startinsert")

    vim.api.nvim_create_autocmd({ "BufWipeout", "WinClosed" }, {
      buffer = M.state.data.buf_id,
      callback = function()
        if vim.api.nvim_win_is_valid(M.state.data.win_id) then
          vim.api.nvim_win_close(M.state.data.win_id, true)
          vim.api.nvim_win_close(M.state.data.overlay_win, true)
        end
      end,
    })
  else
    vim.api.nvim_win_hide(M.state.data.win_id)
  end
end
vim.api.nvim_create_user_command("FloatTermToggle", M.winbuf_toggle, {})
local augroup = vim.api.nvim_create_augroup("custom-term", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  group = augroup,
  callback = function()
    local set = vim.opt_local
    set.buflisted = false
    set.number = false
    set.relativenumber = false
    set.scrolloff = 0
    vim.bo.filetype = "terminal"
  end,
})
au("VimResized", "*", {
  group = TerminalFloat,
  callback = M.resize,
})
