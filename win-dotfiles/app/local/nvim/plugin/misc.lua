local M = {}

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

return M
