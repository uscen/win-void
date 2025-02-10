-----------------------------------------------------------
-- Auto Install Language Server:
-----------------------------------------------------------
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        border = "double",
        width = 0.8,
        height = 0.8,
      },
    })

    -- mason-lspconfig
    mason_lspconfig.setup({
      -- auto installation
      automatic_installation = true,
    })
    -- mason_lspconfig.setup_handlers({
    -- 	function(server_name)
    -- 		require("lspconfig")[server_name].setup({})
    -- 	end,
    -- })

    -- mason-tool-installer
    mason_tool_installer.setup({
      ensure_installed = {
        -- you can turn off/on auto_update per tool
        { "html-lsp" },
        { "css-lsp" },
        { "tailwindcss-language-server" },
        { "emmet-language-server" },
        { "typescript-language-server" },
        { "lua-language-server" },
        { "prettier" },
        { "prisma-language-server" },
        { "eslint-lsp" },
      },

      auto_update = true,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 5,
    })
  end,
}
