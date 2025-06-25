--          ╔═════════════════════════════════════════════════════════╗
--          ║               Smart Enter Between Tags                  ║
--          ╚═════════════════════════════════════════════════════════╝
local function check_html_char()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local prev_char = line:sub(col - 1, col - 1)
  local next_char = line:sub(col, col)
  -- Check if we're between HTML tags (><)
  if prev_char == ">" and next_char == "<" then
    return "<cr><esc>ko"
  end
  -- Handle completion cases
  local complete_info = vim.fn.complete_info()
  if complete_info.selected ~= -1 then
    return '\25'
  end
  -- Default to mini.pairs behavior
  return require('mini.pairs').cr()
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
