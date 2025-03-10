--          ╔═════════════════════════════════════════════════════════╗
--          ║                      TailwindCss LSP                    ║
--          ╚═════════════════════════════════════════════════════════╝
return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "html",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact"
  },
  settings = {
    tailwindCSS = {
      validate = true,
      lint = {
        cssConflict = 'warning',
        invalidApply = 'error',
        invalidScreen = 'error',
        invalidVariant = 'error',
        invalidConfigPath = 'error',
        invalidTailwindDirective = 'error',
        recommendedVariantOrder = 'warning',
      },
      classAttributes = {
        'class',
        'className',
      },
      includeLanguages = {},
    },
  },
  root_markers = {
    'tsconfig.json',
    'jsconfig.json',
    'package.json',
    '.git'
  }
}
