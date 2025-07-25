local fmt = string.format

local modes = {
  ['n']  = { hl = 'normal', long = 'NORMAL', short = 'N' },
  ['no'] = { hl = 'normal', long = 'NORMAL', short = 'N' },
  ['i']  = { hl = 'insert', long = 'INSERT', short = 'I' },
  ['ic'] = { hl = 'insert', long = 'INSERT', short = 'I' },
  ['v']  = { hl = 'visual', long = 'VISUAL', short = 'V' },
  ['V']  = { hl = 'visual', long = 'V-LINE', short = 'VL' },
  ['']  = { hl = 'visual', long = 'V-BLOCK', short = 'VB' },
  ['s']  = { hl = 'misc', long = 'SELECT', short = 'S' },
  ['S']  = { hl = 'misc', long = 'SELECT LINE', short = 'SL' },
  ['']  = { hl = 'misc', long = 'SELECT BLOCK', short = 'SB' },
  ['R']  = { hl = 'misc', long = 'REPLACE', short = 'R' },
  ['Rv'] = { hl = 'misc', long = 'V-REPLACE', short = 'VR' },
  ['c']  = { hl = 'misc', long = 'COMMAND', short = 'C' },
  ['cv'] = { hl = 'misc', long = 'VIM EX', short = 'VE' },
  ['ce'] = { hl = 'misc', long = 'EX', short = 'E' },
  ['r']  = { hl = 'misc', long = 'PROMPT', short = 'P' },
  ['rm'] = { hl = 'misc', long = 'MORE', short = 'M' },
  ['r?'] = { hl = 'misc', long = 'CONFIRM', short = 'CF' },
  ['!']  = { hl = 'misc', long = 'SHELL', short = 'S' },
  ['t']  = { hl = 'misc', long = 'TERMINAL', short = 'T' },
}

local function hl(name)
  return '%#sl_' .. name .. '#'
end

local function mode_text(type)
  local info = modes[vim.api.nvim_get_mode().mode]
  return fmt('%s %s ', hl('mode_' .. info.hl), info[type])
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand '%', ':~:.:h')

  local dirs = vim.split(fpath, '/')
  if #dirs > 3 then
    fpath = fmt(' .../%s/%s/%s', dirs[#dirs - 2], dirs[#dirs - 1], dirs[#dirs])
  end

  return fmt('%s %s/', hl('filepath'), fpath)
end

local function filename()
  return fmt('%s %s', hl('filename'), vim.fn.expand('%:t'))
end

local function buffer_info()
  local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local info = ''

  if vim.api.nvim_get_option_value("modified", { buf = bufnr }) then
    info = fmt(' %s󰐗', hl('modified'))
  end

  if vim.api.nvim_get_option_value("readonly", { buf = bufnr }) then
    info = info .. fmt(' %s[RO]', hl('readonly'))
  end

  return info
end

local function lsp(request)
  local info = vim.lsp.get_clients({ bufnr = 0 })
  if next(info) == nil then
    return ''
  end

  if request == 'names' then
    local names = vim.iter(info):map(function(client)
      local name = client.name:gsub('language.server', 'ls')
      return name
    end):totable()

    local lsp_hl = hl(vim.lsp.inlay_hint.is_enabled() and 'lsp_inlay' or 'lsp_no_inlay')

    return fmt('%s%s ', lsp_hl, table.concat(names, ', '))
  else
    local formatted = ''

    local signs = vim.diagnostic.config().signs.text
    local diags = vim.diagnostic.count(0)

    for severity, count in pairs(diags) do
      formatted = formatted .. fmt('%s%s %d ', hl('diag_' .. severity), signs[severity], count)
    end

    return formatted
  end
end

local function diags_and_branch()
  local diagnostics = lsp('diagnostics')

  local branch = vim.b.minigit_summary_string
  branch = branch ~= nil and hl('branch') .. branch or ''

  if branch ~= '' and diagnostics ~= '' then
    return branch .. ' | ' .. diagnostics
  end

  return branch .. diagnostics
end

local function filetype()
  local ft = vim.bo.filetype
  return ft == '' and '' or fmt('%s %s |', hl('filetype'), ft)
end

local function pos_info()
  if vim.bo.filetype == 'alpha' then
    return ''
  end

  return hl('lineinfo') .. ' %P %l:%c '
end

function Active()
  local width = vim.fn.winwidth(0)

  if width > 100 then
    return table.concat {
      mode_text('long'),
      filepath(),
      filename(),
      buffer_info(),

      '%=',
      diags_and_branch(),

      '%=',
      lsp('names'),

      filetype(),
      pos_info(),
    }
  elseif width > 60 then
    return table.concat {
      mode_text('long'),
      filename(),
      buffer_info(),

      '%=',
      diags_and_branch(),

      '%=',
      lsp('names'),

      filetype(),
      pos_info(),
    }
  else
    return table.concat {
      mode_text('short'),
      filename(),
      buffer_info(),

      '%=',
      filetype(),
      pos_info(),
    }
  end
end

function Inactive()
  return table.concat {
    '%=%F',
    buffer_info(),
    '%='
  }
end

vim.cmd([[
    augroup Statusline
    au!
    au WinEnter,BufEnter * setlocal statusline=%!v:lua.Active()
    au WinLeave,BufLeave * setlocal statusline=%!v:lua.Inactive()
    augroup END
]])
