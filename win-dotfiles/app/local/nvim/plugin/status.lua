--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Statusline                        ║
--          ╚═════════════════════════════════════════════════════════╝
-- Halpers: ========================================================================================================
local function pad_string(str, left_pad, right_pad)
  local left = string.rep(" ", left_pad or 0)
  local right = string.rep(" ", right_pad or 0)
  return left .. str .. right
end
local function hl(str, hl_group, restore)
  hl_group = hl_group or ''
  str = str and tostring(str) or ''
  restore = restore == nil or restore
  return restore and table.concat({ '%#', hl_group, '#', str, '%*' })
    or table.concat({ '%#', hl_group, '#', str })
end
-- get_separator: =======================================================================================================
local function get_separator()
  local highlight_group = "StatusLineseparator"
  return "%#" .. highlight_group .. "#%="
end
-- Filetype: =========================================================================================================
local function get_ft()
  local ft = vim.bo.filetype:lower()
  local categories = {
    WEB = { "javascript", "typescript", "html", "css", "scss", "sass", "less", "vue", "jsx", "tsx", "markdown", "md" },
    ENV = { "lua", "conf", "toml", "ini", "vim", "zsh", "dockerfile", "makefile", "cmake" },
    DAT = { "csv", "xml", "json", "yaml", "toml", "hcl" },
    CFG = { "conf", "ini", "toml", "vim", "gitconfig" },
    SYS = { "sh", "bash", "zsh", "fish", "powershell" },
    DAB = { "sql", "mysql", "plsql", "postgresql" },
    TER = { "terminal", "toggleterm", "floaterm" },
    GIT = { "gitcommit", "gitrebase", "gitconfig" },
    WEL = { "ministarter", "dashboard", "alpha" },
    PLG = { "minipick", "minifiles" }
  }
  for cat, fts in pairs(categories) do
    if vim.tbl_contains(fts, ft) then
      return hl(pad_string(cat, 2, 2), "StatusLineFileType")
    end
  end
  return hl(pad_string(ft:upper(), 2, 2), "StatusLineFileType")
end
-- Mode: ===========================================================================================================
local modes = {
  ['n']      = 'NOR',
  ['no']     = 'OPR',
  ['nov']    = 'OCV',
  ['noV']    = 'OLV',
  ['no\x16'] = 'OBV',
  ['\x16']   = 'VLB',
  ['niI']    = 'INS',
  ['niR']    = 'REP',
  ['niV']    = 'RVI',
  ['nt']     = 'NT',
  ['ntT']    = 'TME',
  ['v']      = 'VIS',
  ['vs']     = 'VIS',
  ['V']      = 'VSL',
  ['Vs']     = 'VSL',
  ['\x16s']  = 'VSB',
  ['s']      = 'SE',
  ['S']      = 'SL',
  ['\x13']   = 'SB',
  ['i']      = 'INS',
  ['ic']     = 'IC',
  ['ix']     = 'IX',
  ['R']      = 'RE',
  ['Rc']     = 'RC',
  ['Rx']     = 'RX',
  ['Rv']     = 'RV',
  ['Rvc']    = 'RVC',
  ['Rvx']    = 'RVX',
  ['c']      = 'COM',
  ['cv']     = 'CV',
  ['r']      = 'PR',
  ['rm']     = 'PM',
  ['r?']     = 'P?',
  ['!']      = 'SHE',
  ['t']      = 'TER',
}
local function get_mode()
  local mode = vim.fn.mode()
  local mode_str = modes[mode]
  return hl(pad_string(mode_str, 2, 2), "StatusLineHeader")
end
-- Diagnostic: =========================================================================================================
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
local function get_diagnostic()
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
-- a function to call and place the statusline components: =====================================================
function Status_line()
  return table.concat({
    get_mode(),
    get_separator(),
    get_diagnostic(),
    get_ft(),
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
