--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Python LSP                          ║
--          ╚═════════════════════════════════════════════════════════╝

return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { ".git", "pyproject.toml" },
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSeachPaths = false,
        diagnosticMode = "openFilesOnly",
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
          reportPrivateImportUsage = "none",
        },
      }
    },
  },
}
