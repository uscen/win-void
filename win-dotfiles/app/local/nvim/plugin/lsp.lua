--          ╔═════════════════════════════════════════════════════════╗
--          ║                  Lsp Removed In 0.11                    ║
--          ╚═════════════════════════════════════════════════════════╝
local servers = {
  lua = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.luarc.json' },
  },
  css = {
    cmd = { 'vscode-css-language-server.cmd', '--stdio' },
    filetypes = { 'css', 'scss', 'less' },
    root_markers = { 'package.json', '.git' }
  },
  biome = {
    cmd = { 'biome.cmd', 'lsp-proxy' },
    filetypes = {
      'astro',
      'css',
      'graphql',
      'javascript',
      'javascriptreact',
      'json',
      'jsonc',
      'svelte',
      'typescript',
      'typescript.tsx',
      'typescriptreact',
      'vue',
    },
    root_markers = { 'biome.json' }
  },
  typescript = {
    cmd = { 'typescript-language-server.cmd', '--stdio' },
    filetypes = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
    },
    root_markers = {
      'tsconfig.json',
      'jsconfig.json',
      'package.json',
      '.git'
    }
  },
  tailwind = {
    cmd = { "tailwindcss-language-server.cmd", "--stdio" },
    filetypes = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact"
    },
    root_markers = {
      'tsconfig.json',
      'jsconfig.json',
      'package.json',
      '.git'
    }
  }
}
local group = vim.api.nvim_create_augroup("user.lsp.start", {})
for name, config in pairs(servers) do
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = config.filetypes,
    callback = function(ev)
      config.name = name
      if config.root_markers then
        config.root_dir = vim.fs.root(ev.buf, config.root_markers)
      end
      vim.lsp.start(config, { bufnr = ev.buf })
    end,
  })
end
