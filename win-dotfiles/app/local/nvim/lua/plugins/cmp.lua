-----------------------------------------------------------
-- Auto Completion
-----------------------------------------------------------
local symbol_map = {
	Text = "",
	Method = "",
	Function = "󰊕",
	Constructor = "󰡱",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = " ",
	Robot = "󱚤",
	Roboti = "󱨚",
	Smiley = " ",
	Note = " ",
}

return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"rafamadriz/friendly-snippets",
			"nrjdalal/shadcn-ui-snippets",
			-- {
			-- 	"zbirenbaum/copilot-cmp",
			-- 	dependencies = { "copilot.lua" },
			-- 	config = function()
			-- 		require("copilot_cmp").setup({
			-- 			event = { "InsertEnter", "LspAttach" },
			-- 			fix_pairs = true,
			-- 		})
			-- 	end,
			-- },
		},

		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				window = {
					completion = {
						border = "single",
						winhighlight = "Normal:TelescopePromptPrefix,FloatBorder:TelescopePromptBorder,CursorLine:TelescopeSelection,Search:None",
					},
					documentation = {
						border = "none",
						winhighlight = "NormalFloat:TelescopePromptPrefix,FloatBorder:TelescopePromptPrefix",
					},
				},
				formatting = {
					format = lspkind.cmp_format({
						symbol_map = symbol_map,
						before = function(entry, vim_item)
							vim_item.kind = string.format(vim_item.kind, symbol_map[vim_item.kind], "%s %s")
							vim_item.menu = ({
								buffer = "[Buffer]",
								nvim_lsp = "[LSP]",
								vsnip = "[Snip]",
								nvim_lua = "[Lua]",
								path = "[Path]",
								copilot = "[Copilot]",
							})[entry.source.name]
							return vim_item
						end,
					}),
				},
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
					["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
					["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "vsnip" },
					{ name = "buffer" },
				}),
				sorting = {
					priority_weight = 2,
					comparators = {
						-- require("copilot_cmp.comparators").prioritize,
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline", keyword_length = 3 },
				}),
			})

			vim.cmd([[
						highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
						highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
						highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
						highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
						highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
						highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
						highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
						highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
						highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
						highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
						highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
				]])
		end,
	},
}
