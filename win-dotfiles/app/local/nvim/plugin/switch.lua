--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Toggle Word                         ║
--          ╚═════════════════════════════════════════════════════════╝
local function toggle()
  local toggles = {
    ['useState(true)'] = 'useState(false)',
    ['relative'] = 'absolute',
    ['active'] = 'inactive',
    ['enable'] = 'disable',
    ['visible'] = 'hidden',
    ['success'] = 'error',
    ['always'] = 'never',
    ['left'] = 'right',
    ['top'] = 'bottom',
    ['true'] = 'false',
    ['allow'] = 'deny',
    ['light'] = 'dark',
    ['show'] = 'hide',
    ['let'] = 'const',
    ['up'] = 'down',
    ['yes'] = 'no',
  }

  local cword = vim.fn.expand('<cword>')
  local newWord
  for word, opposite in pairs(toggles) do
    if cword == word then newWord = opposite end
    if cword == opposite then newWord = word end
  end
  if newWord then
    local prevCursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd.normal { '"_ciw' .. newWord, bang = true }
    vim.api.nvim_win_set_cursor(0, prevCursor)
  end
end
vim.keymap.set('n', '<leader>rr', toggle, { noremap = true, silent = true, desc = 'Toggle word under cursor' })
