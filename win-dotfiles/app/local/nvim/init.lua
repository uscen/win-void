-------------------------------
-- caching needs to be first:
-------------------------------
vim.loader.enable()
------------------------------
-- Basics Configuration:
------------------------------
require("config/options")
require("config/statusline")
require("config/autocmds")
require("config/keymaps")
----------------------------
-- Plugins Bootstrap:
----------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
------------------------------
-- Plugins Trigger:
------------------------------
require("lazy").setup("plugins", {
  ui = {
    border = "double",
    size = {
      width = 0.9,
      height = 0.9,
    },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
