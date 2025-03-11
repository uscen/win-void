--          ╔═════════════════════════════════════════════════════════╗
--          ║                       Colorscheme                       ║
--          ╚═════════════════════════════════════════════════════════╝
local palette
if vim.o.background == "light" then
  palette = {
    base00 = "#F1E3D1",
    base01 = "#DDCEBC",
    base02 = "#C9B9A7",
    base03 = "#B5A492",
    base04 = "#A0907D",
    base05 = "#64513E",
    base06 = "#786653",
    base07 = "#8C7B68",
    base08 = "#D09700",
    base09 = "#64513E",
    base0A = "#993333",
    base0B = "#908D6A",
    base0C = "#d09700",
    base0D = "#BF7979",
    base0E = "#9E5581",
    base0F = "#75858C",
  }
end
if vim.o.background == "dark" then
  palette = {
    base00 = "#141617",
    base01 = "#1b1b1b",
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
    base0C = "#b0b842",
    base0D = "#89b482",
    base0E = "#a9b665",
    base0F = "#bd6f3e",
  }
end
if palette then
  require("mini.base16").setup({
    palette = palette,
    plugins = {
      default = false,
      ['echasnovski/mini.nvim'] = true,
    },
  })
  vim.g.colors_name = "minigruv"
end
-- Pmenu: =====================================================================
vim.api.nvim_set_hl(0, "Pmenu", { bg = palette.base01, fg = palette.base04 })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = palette.base02, fg = palette.base07 })
vim.api.nvim_set_hl(0, "PmenuMatch", { fg = palette.base0B })
vim.api.nvim_set_hl(0, "PmenuMatchSel", { fg = palette.base0C })
vim.api.nvim_set_hl(0, "PmenuSbar", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "PmenuThumb", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "PmenuExtra", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "PmenuKind", { link = "Pmenu" })
vim.api.nvim_set_hl(0, "PmenuExtraSel", { link = "PmenuSel" })
vim.api.nvim_set_hl(0, "PmenuKindSel", { link = "PmenuSel" })
-- Tabline :===================================================================
vim.api.nvim_set_hl(0, "MiniTablineCurrent", { fg = palette.base0B, bg = palette.base00, bold = true, italic = true })
vim.api.nvim_set_hl(0, "MiniTablineHidden", { fg = palette.base03, bg = palette.base00, bold = true, italic = true })
vim.api.nvim_set_hl(0, "MiniTablineVisible", { link = "MiniTablineCurrent" })
vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", { link = "MiniTablineCurrent" })
vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", { link = "MiniTablineCurrent" })
vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", { link = "MiniTablineHidden" })
vim.api.nvim_set_hl(0, "MiniTablineTabpagesSection", { link = "MiniTablineCurrent" })
vim.api.nvim_set_hl(0, "MiniTablineFill", { link = "MiniTablineCurrent" })
-- CursorWord =================================================================
vim.api.nvim_set_hl(0, "MiniCursorword", { bg = palette.base02 })
vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { link = "MiniCursorword" })
-- Indentscope =================================================================
vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = palette.base0E })
