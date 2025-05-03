--          ╔═════════════════════════════════════════════════════════╗
--          ║                     Docker LSP                          ║
--          ╚═════════════════════════════════════════════════════════╝
return {
  cmd = { "docker-langserver", "--stdio" },
  single_file_support = true,
  filetypes = { "dockerfile" },
  root_markers = { "Dockerfile" },
}
