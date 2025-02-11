-----------------------------------------------------------
-- Language Server:
-----------------------------------------------------------
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    -- Managing language servers individually
    -- Html
    lspconfig.html.setup({
      capabilities = capabilities,
    })
    -- Css
    lspconfig.cssls.setup({
      capabilities = capabilities,
    })
    -- Tailwind
    lspconfig.tailwindcss.setup({
      capabilities = capabilities
    })
    -- Emmet Language Server
    lspconfig.emmet_language_server.setup({
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss" },
    })
    -- Tsserver
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })
    -- Prisma
    lspconfig.prismals.setup({
      capabilities = capabilities,
    })
    -- Lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    -- eslint
    lspconfig.eslint.setup({
      on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })
  end,
}
