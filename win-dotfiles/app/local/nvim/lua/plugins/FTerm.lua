-----------------------------------------------------------
-- FTerm Terminal
-----------------------------------------------------------
return {
  "numToStr/FTerm.nvim",
  event = "VeryLazy",
  config = function()
    local fterm = require("FTerm")
    fterm.setup({
      border = "double",
      dimensions = {
        height = 0.9,
        width = 0.9
      }
    })
    local lazygit = fterm:new({
      ft = 'fterm_lazygit',
      cmd = "lazygit",
      dimensions = {
        height = 0.9,
        width = 0.9
      }
    })
    vim.keymap.set('n', '<leader>tg', function()
      lazygit:toggle()
    end)
    vim.keymap.set('n', '<leader>lg', function()
      lazygit:toggle()
    end)
    vim.keymap.set('n', '<leader>td', '<CMD>lua require("FTerm").run("npm run dev")<CR>')
    vim.keymap.set('n', '<leader>tb', '<CMD>lua require("FTerm").run("npm run build")<CR>')
    vim.keymap.set('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end
}
