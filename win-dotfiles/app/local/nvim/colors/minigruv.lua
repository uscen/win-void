require("mini.base16").setup({
  palette = {
    base00 = "#141617",
    base01 = "#141617",
    base02 = "#282828",
    base03 = "#5a524c",
    base04 = "#bdae93",
    base05 = "#ddc7a1",
    base06 = "#ebdbb2",
    base07 = "#fbf1c7",
    base08 = "#ea6962",
    base09 = "#e78a4e",
    base0A = "#d8a657",
    base0B = "#a9b665",
    base0C = "#89b482",
    base0D = "#89b482",
    base0E = "#a9b665",
    base0F = "#bd6f3e",
  },
  use_cterm = true,
  plugins = {
    default = false,
    ['echasnovski/mini.nvim'] = true,
  },
})
-- Pmenu: =====================================================================
vim.api.nvim_set_hl(0, "Pmenu", { bg = "#141617", fg = "#ebdbb2" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282828", fg = "#a9b665" })
vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#141617" })
vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#141617" })
vim.api.nvim_set_hl(0, "PmenuMatch", { fg = "#a9b665" })
vim.api.nvim_set_hl(0, "PmenuMatchSel", { fg = "#89b482" })
vim.api.nvim_set_hl(0, "PmenuExtra", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "PmenuKind", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "PmenuExtraSel", { link = "PmenuSel" })
vim.api.nvim_set_hl(0, "PmenuKindSel", { link = "PmenuSel" })
-- Tabline :===================================================================
vim.api.nvim_set_hl(0, "MiniTablineCurrent", { fg = "#a9b665", bg = "#141617", bold = true, italic = true })
vim.api.nvim_set_hl(0, "MiniTablineHidden", { fg = "#928374", bg = "#141617", bold = true, italic = true })
vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "MiniTablineCurrent" })
vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { link = "MiniTablineCurrent" })
vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { link = "MiniTablineCurrent" })
vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { link = "MiniTablineHidden" })
vim.api.nvim_set_hl(0, "MiniTablineTabpagesSection", { link = "MiniTablineCurrent" })
vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "MiniTablineCurrent" })
vim.g.colors_name = "minigruv"
