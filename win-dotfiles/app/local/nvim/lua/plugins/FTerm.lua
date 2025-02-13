-----------------------------------------------------------
-- FTerm Terminal
-----------------------------------------------------------
return {
  "numToStr/FTerm.nvim",
  event = "VeryLazy",
  config = function()
    local fterm = require("FTerm")
    fterm.setup({
      border     = "double",
      cmd        = "nu",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    })
    local second_term = fterm:new({
      ft = 'fterm_bash',
      cmd = "nu",
      border = "double",
    })
    local lazygit = fterm:new({
      ft = 'fterm_lazygit',
      cmd = "lazygit",
      border = "double",
    })
    local yazi = fterm:new({
      ft = 'fterm_yazi',
      cmd = "bash -c yazi",
      border = "double",
    })
    local tgpt = fterm:new({
      ft = 'fterm_tgpt',
      cmd = "tgpt -m",
      border = "double",
    })
    local htop = fterm:new({
      ft = 'fterm_htop',
      cmd = "ntop",
      border = "double",
    })
    vim.keymap.set('n', '<leader>tt', function()
      second_term:toggle()
    end)
    vim.keymap.set('n', '<leader>tg', function()
      lazygit:toggle()
    end)
    vim.keymap.set('n', '<leader>lg', function()
      lazygit:toggle()
    end)
    vim.keymap.set('n', '<leader>ty', function()
      yazi:toggle()
    end)
    vim.keymap.set('n', '<leader>tc', function()
      tgpt:toggle()
    end)
    vim.keymap.set('n', '<leader>th', function()
      htop:toggle()
    end)
    vim.keymap.set('n', '<leader>td', '<CMD>lua require("FTerm").run("npm run dev")<CR>')
    vim.keymap.set('n', '<leader>tb', '<CMD>lua require("FTerm").run("npm run build")<CR>')
    vim.keymap.set('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
  end
}
