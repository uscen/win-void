--          ╔═════════════════════════════════════════════════════════╗
--          ║                         Misc                            ║
--          ╚═════════════════════════════════════════════════════════╝
local M = {}
-- Open url in buffer: ==============================================================================================
function M.openUrlInBuffer()
  local text = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), '\n')
  local urls = {}
  for url in text:gmatch([[%l%l%l+://[^%s)%]}"'`>]+]]) do
    urls[#urls + 1] = url
  end
  if #urls == 0 then
    return vim.notify('No URL found in file.', vim.log.levels.WARN)
  elseif #urls == 1 then
    return vim.ui.open(urls[1])
  end
  vim.ui.select(urls, { prompt = ' Open URL:' }, function(url)
    if url then vim.ui.open(url) end
  end)
end

vim.api.nvim_create_user_command('OpenUrlInBuffer', M.openUrlInBuffer, {})

-- Smart duplicate line: ==============================================================================================
function M.smartDuplicate()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line = vim.api.nvim_get_current_line()
  local ft = vim.bo.filetype
  -- FILETYPE-SPECIFIC TWEAKS
  if ft == 'css' then
    local newLine = line
    if line:find('top:') then newLine = line:gsub('top:', 'bottom:') end
    if line:find('bottom:') then newLine = line:gsub('bottom:', 'top:') end
    if line:find('right:') then newLine = line:gsub('right:', 'left:') end
    if line:find('left:') then newLine = line:gsub('left:', 'right:') end
    line = newLine
  elseif ft == 'javascript' or ft == 'typescript' or ft == 'swift' then
    line = line:gsub('^(%s*)if(.+{)$', '%1} else if%2')
  elseif ft == 'lua' then
    line = line:gsub('^(%s*)if( .* then)$', '%1elseif%2')
  elseif ft == 'zsh' or ft == 'bash' then
    line = line:gsub('^(%s*)if( .* then)$', '%1elif%2')
  elseif ft == 'python' then
    line = line:gsub('^(%s*)if( .*:)$', '%1elif%2')
  end
  -- INSERT DUPLICATED LINE
  vim.api.nvim_buf_set_lines(0, row, row, false, { line })
  -- MOVE CURSOR DOWN, AND TO VALUE/FIELD (IF THERE IS ANY)
  local _, luadocFieldPos = line:find('%-%-%-@%w+ ')
  local _, valuePos = line:find('[:=] ')
  local targetCol = luadocFieldPos or valuePos or col
  vim.api.nvim_win_set_cursor(0, { row + 1, targetCol })
end

vim.api.nvim_create_user_command('SmartDuplicate', M.smartDuplicate, {})

-- Smart duplicate line: ==============================================================================================
function M.lspCapabilities()
  local clients = vim.lsp.get_clients { bufnr = 0 }
  if #clients == 0 then
    vim.notify('No LSPs attached.', vim.log.levels.WARN, { icon = '󱈄' })
    return
  end
  vim.ui.select(clients, {
    prompt = '󱈄 Select LSP:',
    format_item = function(client) return client.name end,
  }, function(client)
    if not client then return end
    local info = {
      capabilities = client.capabilities,
      server_capabilities = client.server_capabilities,
      config = client.config,
    }
    local opts = { icon = '󱈄', title = client.name .. ' capabilities', ft = 'lua' }
    local header = '-- For a full view, open in notification history.\n'
    vim.notify(header .. vim.inspect(info), vim.log.levels.DEBUG, opts)
  end)
end

vim.api.nvim_create_user_command('LSPCapabilities', M.lspCapabilities, {})
