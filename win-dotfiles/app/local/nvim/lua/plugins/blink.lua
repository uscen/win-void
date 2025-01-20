-----------------------------------------------------------
-- Blink cmp Completions:
-----------------------------------------------------------
return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = { "snippet_backward", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<S-k>"] = { "scroll_documentation_up", "fallback" },
			["<S-j>"] = { "scroll_documentation_down", "fallback" },
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-n>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<C-p>"] = { "hide", "fallback" },
		},

		completion = {
			menu = {
				auto_show = false,
				min_width = 20,
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = {
					border = "single",
				},
			},
			ghost_text = {
				enabled = false,
			},
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
			kind_icons = {
				Text = "󰦨", -- `buffer`
				Snippet = "󰞘", -- `snippets`
				File = "", -- `path`
				Folder = "󰉋",
				Method = "󰊕",
				Function = "󰡱",
				Constructor = "",
				Field = "󰇽",
				Variable = "󰀫",
				Class = "󰜁",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Color = "󰏘",
				Reference = "",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "󰅲",
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
	},
	opts_extend = { "sources.default" },
}
