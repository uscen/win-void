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
        unusedClasses = "warning",
      },
      classAttributes = {
        'class',
        'className',
      },
      includeLanguages = {
        typescriptreact = "javascript",
        javascriptreact = "javascript",
        html = "html",
        svelte = "html",
        vue = "html",
      },
      experimental = {
        classRegex = {
          "cn\\(([^)]*)\\)", "clsx\\(([^)]*)\\)",
          "cva\\(([^)]*)\\)", "twMerge\\(([^)]*)\\)",
        },
      },
    },
  },
  root_markers = {
    'tsconfig.json',
    'jsconfig.json',
    'package.json',
    '.git'
  }
}
