--              ╔═════════════════════════════════════════════════════════╗
--              ║                           Typst                         ║
--              ╚═════════════════════════════════════════════════════════╝
-- Options: ======================================================================================
vim.opt_local.wrap = true
vim.opt_local.spell = true
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.shiftwidth = 2
-- Keymaps: ======================================================================================
vim.keymap.set("n", "<leader>p", ":TypstPreview<CR>", { buffer = 0 })
vim.keymap.set( 'n', '<leader>r', vim.cmd.TypstPreview, { buffer = 0 })
