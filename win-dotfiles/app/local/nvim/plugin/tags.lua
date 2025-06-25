--          ╔═════════════════════════════════════════════════════════╗
--          ║               Smart Enter Between Tags                  ║
--          ╚═════════════════════════════════════════════════════════╝
local function check_html_char()
  local prev_col, next_col = vim.fn.col(".") - 1, vim.fn.col(".") ---@type number
  local prev_char = vim.fn.getline("."):sub(prev_col, prev_col)
  local next_char = vim.fn.getline("."):sub(next_col, next_col)
  if prev_char:match(">") and next_char:match("<") then
    return "<cr><esc>ko"
  else
    if vim.fn.complete_info()['selected'] ~= -1 then
      return vim.fn.complete_info()['selected'] ~= -1 and '\25' or '\25\r'
    else
      return require('mini.pairs').cr()
    end
  end
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'html', 'xml', 'jsx', 'tsx', "typescriptreact", "javascriptreact", 'vue', 'svelte' },
  callback = function()
    vim.keymap.set('i', '<CR>', check_html_char, {
      noremap = true,
      silent = true,
      buffer = true,
      expr = true,
      desc = "Smart enter between tags",
    })
  end
})
