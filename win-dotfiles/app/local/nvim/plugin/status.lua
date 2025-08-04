--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Statusline                        ║
--          ╚═════════════════════════════════════════════════════════╝
-- Halpers: =======================================================================================================
local function pad_string(str, left_pad, right_pad)
  local left = string.rep(" ", left_pad or 0)
  local right = string.rep(" ", right_pad or 0)
  return left .. str .. right
end
local function hl(str, hl, restore)
  hl = hl or ''
  str = str and tostring(str) or ''
  restore = restore == nil or restore
  return restore and table.concat({ '%#', hl, '#', str, '%*' })
    or table.concat({ '%#', hl, '#', str })
end
-- a function to obtain and format the current mode: ===========================================================
local modes = {
  ['n']      = 'NO',
  ['no']     = 'OP',
  ['nov']    = 'OC',
  ['noV']    = 'OL',
  ['no\x16'] = 'OB',
  ['\x16']   = 'VB',
  ['niI']    = 'IN',
  ['niR']    = 'RE',
  ['niV']    = 'RV',
  ['nt']     = 'NT',
  ['ntT']    = 'TM',
  ['v']      = 'VI',
  ['vs']     = 'VI',
  ['V']      = 'VL',
  ['Vs']     = 'VL',
  ['\x16s']  = 'VB',
  ['s']      = 'SE',
  ['S']      = 'SL',
  ['\x13']   = 'SB',
  ['i']      = 'IN',
  ['ic']     = 'IC',
  ['ix']     = 'IX',
  ['R']      = 'RE',
  ['Rc']     = 'RC',
  ['Rx']     = 'RX',
  ['Rv']     = 'RV',
  ['Rvc']    = 'RC',
  ['Rvx']    = 'RX',
  ['c']      = 'CO',
  ['cv']     = 'CV',
  ['r']      = 'PR',
  ['rm']     = 'PM',
  ['r?']     = 'P?',
  ['!']      = 'SH',
  ['t']      = 'TE',
}
local function current_mode()
  local hl_type = vim.bo.mod and 'StatusLineHeaderModified' or 'StatusLineHeader'
  local mode = vim.fn.mode()
  local mode_str = (mode == 'n' and (vim.bo.ro or not vim.bo.ma)) and 'RO'
    or modes[mode]
  return hl(pad_string(string.format(' %s ', mode_str), 1, 1), hl_type)
end
-- a function to obtain and format the LSP: ====================================================================
local diag_signs_default_text = { 'E', 'W', 'I', 'H' }
local diag_severity_map = {
  [1] = 'ERROR',
  [2] = 'WARN',
  [3] = 'INFO',
  [4] = 'HINT',
  ERROR = 1,
  WARN = 2,
  args = 3,
  HINT = 4,
}
local function get_diag_sign_text(severity)
  local diag_config = vim.diagnostic.config()
  local signs_text = diag_config
    and diag_config.signs
    and type(diag_config.signs) == 'table'
    and diag_config.signs.text
  return signs_text
      and (signs_text[severity] or signs_text[diag_severity_map[severity]])
    or (
      diag_signs_default_text[severity]
      or diag_signs_default_text[diag_severity_map[severity]]
    )
end
local function diag()
  if vim.b.diag_str_cache then
    return vim.b.diag_str_cache
  end
  local str = ''
  local buf_cnt = vim.b.diag_cnt_cache or {}
  for serverity_nr, severity in ipairs({ 'Error', 'Warn', 'INFO', 'Hint' }) do
    local cnt = buf_cnt[serverity_nr] ~= vim.NIL and buf_cnt[serverity_nr] or 0
    if cnt > 0 then
      local icon_text = get_diag_sign_text(serverity_nr)
      local icon_hl = 'StatusLineDiagnostic' .. severity
      str = str
        .. (str == '' and '' or ' ')
        .. hl(icon_text, icon_hl)
        .. cnt
    end
  end
  if str:find('%S') then
    str = str .. ' '
  end
  vim.b.diag_str_cache = str
  return str
end
vim.api.nvim_create_autocmd('DiagnosticChanged', {
  group = vim.api.nvim_create_augroup('StatusLine', {}),
  desc = 'Update diagnostics cache for the status line.',
  callback = function(args)
    vim.b[args.buf].diag_cnt_cache = vim.diagnostic.count(args.buf)
    vim.b[args.buf].diag_str_cache = nil
    pcall(vim.cmd.redrawstatus, {
      mods = { emsg_silent = true },
    })
  end,
})
-- a function to obtain and format the LSP: ====================================================================
local function stbufnr()
  return vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
end
local function lsp()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_clients()) do
      if client.attached_buffers[stbufnr()] and client.name ~= "mini.snippets" then
        return hl(pad_string("LP", 2, 2), "StatusLineLsp")
      end
    end
  end
  return hl(pad_string("LP", 2, 2), "StatusLineNoLsp")
end
-- a function to assign highlight group to the separator: ======================================================
local function separator()
  local highlight_group = "StatusLineseparator"
  return "%#" .. highlight_group .. "#%="
end
-- a function to call and place the statusline components: =====================================================
function Status_line()
  local curr_ft = vim.bo.filetype
  local disabled_filetypes = {
    "ministarter",
  }
  if vim.tbl_contains(disabled_filetypes, curr_ft) then
    return nil
  end
  return table.concat({
    current_mode(),
    separator(),
    diag(),
    lsp(),
  })
end
-- default with statusline but can be toggled with <leader>st: ================================================
vim.keymap.set( "n", "<leader>st",
  function()
    if vim.o.laststatus == 0 then
      vim.cmd("set laststatus=3")
    else
      vim.cmd("set laststatus=0")
    end
  end
)
vim.cmd("set statusline=%!v:lua.Status_line()")
