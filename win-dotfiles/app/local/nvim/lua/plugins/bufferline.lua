-----------------------------------------------------------
-- bufferline
-----------------------------------------------------------
return {
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<TAB>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
			{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
			{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
			{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
			{ "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
			{ "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
			{ "<leader>bp", "<Cmd>BufferLinePick<CR>", desc = "Choose Buffer" },
			{ "<leader>bc", "<Cmd>BufferLinePickClose<CR>", desc = "Choose Buffer to Close" },
			{ "<leader>bl", "<Cmd>BufferLineMoveNext<CR>", desc = "Move Buffer Right" },
			{ "<leader>bh", "<Cmd>BufferLineMovePrev<CR>", desc = "Move Buffer Left" },
		},
		opts = {
			options = {
				separator_style = "slant",
				mode = "buffers",
				numbers = "none",
				close_command = "bdelete! %d",
				-- hover not working
				hover = { enabled = false, delay = 200, reveal = { "close" } },
				middle_mouse_command = nil,
				indicator = { icon = "▎", style = "icon" },
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				name_formatter = function(buf)
					-- remove extension from markdown files for example
					if buf.name:match("%.md") then
						return vim.fn.fnamemodify(buf.name, ":t:r")
					end
				end,
				max_name_length = 18,
				max_prefix_length = 18,
				tab_size = 17,
				truncate_names = true,
				diagnostics = "nvim_lsp",
				diagnostics_update_in_insert = false,
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						text_align = "center",
						highlight = "Directory",
						padding = 0,
					},
				},
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				show_tab_indicators = true,
				persist_buffer_sort = true,
				enforce_regular_tabs = true,
				always_show_bufferline = false,
				-- add custom logic
				custom_areas = {
					right = function()
						local result = {}
						local seve = vim.diagnostic.severity
						local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
						local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
						local info = #vim.diagnostic.get(0, { severity = seve.INFO })
						local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

						if error ~= 0 then
							table.insert(result, { text = "  " .. error, fg = "#EC5241" })
						end

						if warning ~= 0 then
							table.insert(result, { text = "  " .. warning, fg = "#EFB839" })
						end

						if hint ~= 0 then
							table.insert(result, { text = "  " .. hint, fg = "#A3BA5E" })
						end

						if info ~= 0 then
							table.insert(result, { text = "  " .. info, fg = "#7EA9A7" })
						end
						return result
					end,
				},
			},
			highlights = {
				fill = { bg = "#0d0e0f", fg = "#0d0e0f" },
				background = { bg = "#0d0e0f" },
				separator = { bg = "#0d0e0f", fg = "#0d0e0f" },
				separator_selected = { fg = "#0d0e0f" },
				separator_visible = { fg = "#0d0e0f" },
				close_button_visible = { bg = "#0d0e0f" },
				close_button = { bg = "#0d0e0f" },
				buffer_selected = { fg = "#689d6a", bold = true, italic = false },
				diagnostic_selected = { bold = true },
				info_selected = { bold = true },
				info_diagnostic_selected = { bold = true },
				warning_selected = { bold = true },
				warning_diagnostic_selected = { bold = true },
				error_selected = { bold = true },
				error_diagnostic_selected = { bold = true },
			},
		},
	},
	-----------------------------------------------------------
	-- bufdel
	-----------------------------------------------------------
	{
		"ojroques/nvim-bufdel",
		keys = {
			{ "<leader>bd", "<Cmd>BufDel<CR>", desc = "Close Current Buffer" },
			{ "<leader>bo", "<Cmd>BufDelOthers<CR>", desc = "Close Others Buffers" },
		},
		opts = {
			next = "tabs",
			quit = true, -- quit Neovim when last buffer is closed
		},
	},
}
