--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Floating Terminal                   ║
--          ╚═════════════════════════════════════════════════════════╝
local M = {}
local au = function(event, pattern, opts)
  opts = opts or {}
  vim.api.nvim_create_autocmd(event, vim.tbl_extend('force', opts, { pattern = pattern }))
end
M.state = {
  data = { buf_id = -1, win_id = -1 },
  window = function()
    local current_columns = vim.o.columns
    local current_lines = vim.o.lines

    local width = math.floor(current_columns * 0.8)
    local height = math.floor(current_lines * 0.8)
    local col = math.floor(0.8 * (current_columns - width) / 2)
    local row = math.floor((current_lines - height) / 2)
    return {
      title = 'Terminal',
      relative = 'editor',
      title_pos = 'left',
      width = width,
      height = height,
      col = col,
      row = row,
      style = 'minimal',
      border = 'bold',
      zindex = 5,
    }
  end,
}
local TerminalFloat = vim.api.nvim_create_augroup('TerminalResize', { clear = true })
M.resize = function()
  if M.state.data.win_id == nil or not vim.api.nvim_win_is_valid(M.state.data.win_id) then return end

  local current_columns = vim.o.columns
  local current_lines = vim.o.lines

  local window_config = M.state.window()
  vim.api.nvim_win_set_config(M.state.data.win_id, window_config)

  if vim.api.nvim_win_is_valid(M.state.data.overlay_win) then
    local overlay_config = { width = current_columns, height = current_lines }
    vim.api.nvim_win_set_config(M.state.data.overlay_win, overlay_config)
  end

  vim.cmd([[redraw!]])
end

M.winbuf = function(opts)
  opts = opts or {}
  vim.schedule(function() vim.api.nvim_exec_autocmds('User', { pattern = 'TerminalPro' }) end)
  local overlay_buf = vim.api.nvim_create_buf(false, true)
  vim.bo[overlay_buf].bufhidden = 'wipe'

  local overlay_opts = {
    style = 'minimal',
    relative = 'win',
    border = 'single',
    width = vim.o.columns,
    height = vim.o.lines,
    row = 0,
    col = 0,
    focusable = false,
    zindex = 1,
  }
  local overlay_win = vim.api.nvim_open_win(overlay_buf, false, overlay_opts)
  vim.wo[overlay_win].winblend = 15
  vim.wo[overlay_win]['winhighlight'] = 'NormalFloat:NormalFloat'

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
    if vim.bo[M.state.data.buf_id].buftype ~= 'terminal' then vim.cmd('terminal elvish') end
    vim.cmd('startinsert')

    vim.api.nvim_create_autocmd({ 'BufWipeout', 'WinClosed' }, {
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
M.winbuf_lazyGit = function()
  local term = M.winbuf { buf_id = M.state.data.buf_id }
  M.state.data = term
  if vim.api.nvim_win_is_valid(term.win_id) then
    local job_id = vim.cmd.terminal('lazygit')
    vim.api.nvim_create_autocmd('TermOpen', {
      buffer = term.buf_id,
      once = true,
      callback = function()
        vim.fn.chansend(job_id, 'lazygit\n')
      end,
    })
  end
  vim.cmd('startinsert')
  vim.api.nvim_create_autocmd({ 'BufWipeout', 'WinClosed' }, {
    buffer = M.state.data.buf_id,
    callback = function()
      if vim.api.nvim_win_is_valid(M.state.data.win_id) then
        vim.api.nvim_win_close(M.state.data.win_id, true)
        vim.api.nvim_win_close(M.state.data.overlay_win, true)
      end
    end,
  })
end
-- create user commands: =========================================================================
vim.api.nvim_create_user_command('FloatTermToggle', M.winbuf_toggle, {})
vim.api.nvim_create_user_command('FloatTermLazyGit', M.winbuf_lazyGit, {})
-- Resize Treminal When Resize Neovim: ===========================================================
au('VimResized', '*', { group = TerminalFloat, callback = M.resize })

--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Split Terminal                      ║
--          ╚═════════════════════════════════════════════════════════╝
vim.schedule(function()
  _G.Terminal = { store = {} }
  function Terminal.close(id, unload)
    local term = Terminal.store[id]
    if not term then
      return nil
    end
    local count = nil
    if vim.api.nvim_win_is_valid(term.win) then
      local buf = vim.api.nvim_win_get_buf(term.win)
      count = vim.b[buf].term_count
      vim.api.nvim_win_close(term.win, unload)
      term.win = -1
    end
    if unload then
      for _, buf in ipairs(term.buflist) do
        vim.api.nvim_buf_delete(buf, { force = true })
      end
      Terminal.store[id] = nil
    end
    return count
  end

  function Terminal.open(id, count, win_config)
    count = count or 1
    win_config = win_config or {}
    Terminal.store[id] = Terminal.store[id] or { win = -1, buflist = {} }
    local term = Terminal.store[id]
    local mods = { mods = { split = 'botright' } }
    local new = function(buf, win_conf)
      buf = buf or -1
      win_conf = win_conf or {}
      local is_buf = vim.api.nvim_buf_is_valid(buf)
      if is_buf then
        vim.cmd.split(mods)
      else
        vim.cmd.terminal(mods)
        buf = vim.api.nvim_get_current_buf()
      end
      local win = vim.api.nvim_get_current_win()
      term.win = win
      vim.api.nvim_win_set_config(win, win_conf)
      if is_buf then
        vim.wo[win].winfixbuf = false
        vim.api.nvim_win_set_buf(win, buf)
      end
      vim.wo[win].winfixbuf = true
      term.buflist[count] = buf
      vim.b[buf].term_count = count
    end
    if vim.api.nvim_win_is_valid(term.win) then
      local buf = term.buflist[count] or -1
      if vim.api.nvim_buf_is_valid(buf) then
        vim.api.nvim_win_set_config(0, win_config)
        vim.wo[term.win].winfixbuf = false
        vim.api.nvim_win_set_buf(term.win, buf)
        vim.wo[term.win].winfixbuf = true
      else
        local win_state = vim.api.nvim_win_get_config(term.win)
        vim.api.nvim_win_close(term.win, false)
        new(nil, win_state)
      end
    else
      local buf = term.buflist[count] or -1
      new(buf, win_config)
    end
    return term.win
  end

  local last_count = 1 ---@type integer?
  local win = -1
  local win_config = { height = 15 }
  local open_term = function(count)
    win = Terminal.open('default', count, win_config)
    vim.wo[win].winbar = 'Terminal ' .. count
  end
  local function splitTermToggle()
    if vim.api.nvim_win_is_valid(win) then
      if vim.v.count == 0 then
        win_config = vim.api.nvim_win_get_config(win)
        last_count = Terminal.close('default', false)
      else
        open_term(vim.v.count1)
      end
    else
      open_term(vim.v.count == 0 and last_count or vim.v.count1)
    end
  end

  vim.api.nvim_create_user_command('SplitTermToggle', splitTermToggle, {})
end)
