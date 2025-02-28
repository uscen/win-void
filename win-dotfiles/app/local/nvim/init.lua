-------------------------------
-- caching needs to be first:
-------------------------------
vim.loader.enable()
------------------------------
-- Basics Configuration:
------------------------------
require("config/colorscheme")
require("config/options")
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
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
------------------------------
-- Plugins Trigger:
------------------------------
require("lazy").setup("plugins", {
  concurrency = 4,
  git = {
    timeout = 480,
  },
  change_detection = {
    notify = false,
  },
  checker = {
    enabled = true,
    notify = false,
  },
  ui = {
    border = "none",
    size = {
      width = 0.9,
      height = 0.9,
    },
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,
    rtp = {
      disabled_plugins = {
        "osc52",
        "parser",
        "gzip",
        "netrwPlugin",
        "health",
        "man",
        "matchit",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "shadafile",
        "spellfile",
        "editorconfig",
      },
    },
  },
})
