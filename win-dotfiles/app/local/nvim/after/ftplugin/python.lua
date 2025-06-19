-- Show line after desired maximum text width
vim.cmd('setlocal colorcolumn=89')

-- Keybindings
vim.keymap.set('i', '<M-i>', ' = ', { buffer = 0 })

-- Indentation
vim.g.pyindent_open_paren = 'shiftwidth()'
vim.g.pyindent_continue = 'shiftwidth()'

-- mini.indentscope
vim.b.miniindentscope_config = { options = { border = 'top' } }
