-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------
-----------------------------------------------------------
-- Highlight on yank
-----------------------------------------------------------
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})
-----------------------------------------------------------
-- Don't Comment New Line
-----------------------------------------------------------
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
  end,
})
-----------------------------------------------------------
-- Oil File Manager
-----------------------------------------------------------
-- Create Oil Toggle
vim.api.nvim_create_user_command("OilToggle", function()
  local current_buf = vim.api.nvim_get_current_buf()
  local current_filetype = vim.api.nvim_buf_get_option(current_buf, "filetype")

  if current_filetype == "oil" then
    -- We use a command to go to the previous buffer
    vim.cmd("b#")
  else
    -- Open oil if not already in an oil buffer
    vim.cmd("Oil")
  end
end, { nargs = 0 })
