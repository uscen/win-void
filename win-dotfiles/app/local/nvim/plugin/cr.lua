--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Smart Enter                       ║
--          ╚═════════════════════════════════════════════════════════╝
local cr_default = vim.api.nvim_replace_termcodes('<CR>', true, true, true)
local esc_O = vim.api.nvim_replace_termcodes('<CR><Esc>O', true, true, true)
local ctrl_y = vim.api.nvim_replace_termcodes('<C-y>', true, true, true)

local function smart_enter()
  local col = vim.fn.col('.')
  local line = vim.api.nvim_get_current_line()
  -- tag check using byte comparison: ====================================================================
  if col > 1 and col <= #line then
    local prev_byte = line:byte(col - 1)
    local next_byte = line:byte(col)
    if prev_byte == 62 and next_byte == 60 then
      return esc_O
    end
  end
  -- Handle completion selection: =======================================================================
  if vim.fn.pumvisible() == 1 then
    local complete_info = vim.fn.complete_info()
    if complete_info.selected ~= -1 then
      return ctrl_y
    end
  end
  -- Fallback to mini.pairs with safe require: ==========================================================
  local ok = pcall(require, 'mini.pairs')
  return ok and require('mini.pairs').cr() or cr_default
end
-- Register filetypes in a set for O(1) lookups: ========================================================
local filetypes = {
  html = true,
  xml = true,
  jsx = true,
  tsx = true,
  typescriptreact = true,
  javascriptreact = true,
  vue = true,
  svelte = true,
}
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    if filetypes[vim.bo[args.buf].filetype] then
      vim.keymap.set('i', '<CR>', smart_enter, {
        noremap = true,
        silent = true,
        buffer = args.buf,
        expr = true,
        desc = "Smart Enter",
      })
    end
  end
})
