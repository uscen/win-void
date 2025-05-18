--          ╔═════════════════════════════════════════════════════════╗
--          ║                    Typescript LSP                       ║
--          ╚═════════════════════════════════════════════════════════╝
return {
  cmd = { "vtsls", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  settings = {
    vtsls = {
      autoUseWorkspaceTsdk = true,
      experimental = {
        maxInlayHintLength = 30,
        -- For completion performance.
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
    typescript = {
      preferences = {
        inlayHints = {
          parameterNames = {
            enabled = "all",
          },
          parameterTypes = {
            enabled = true,
          },
          variableTypes = {
            enabled = true,
          },
          propertyDeclarationTypes = {
            enabled = true,
          },
          functionLikeReturnTypes = {
            enabled = true,
          },
          enumMemberValues = {
            enabled = true,
          },
        },
        importModuleSpecifier = "relative",
        importModuleSpecifierEnding = "auto",
      },
    },
  },
  single_file_support = true,
}
