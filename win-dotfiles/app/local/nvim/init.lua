-------------------------------
-- caching needs to be first:
-------------------------------
vim.loader.enable()
------------------------------
-- Basics Configuration:
------------------------------
require("config/options")
require("config/keymaps")
require("config/autocmds")
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
    border = "single",
    size = {
      width = 0.8,
      height = 0.8,
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
