-----------------------------------------------------------
-- AutoFormate
-----------------------------------------------------------
return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	keys = {
		{
			mode = { "n", "i" },
			"<C-f>",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			desc = "Format current buffer",
		},
	},
	opts = {
		format = {
			timeout_ms = 3000,
			async = false, -- not recommended to change
			quiet = false, -- not recommended to change
		},
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			svelte = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			graphql = { "prettier" },
			lua = { "stylua" },
			terraform = { "terraform_fmt" },
			python = { "isort", "black" },
		},

		formatters = {
			injected = { options = { ignore_errors = true } },
		},
		format_on_save = function(bufnr)
			-- Disable autoformat on certain filetypes
			local ignore_filetypes = { "sql", "java" }
			if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
				return
			end
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			-- Disable autoformat for files in a certain path
			local bufname = vim.api.nvim_buf_get_name(bufnr)
			if bufname:match("/node_modules/") then
				return
			end
			-- ...additional logic...
			return { timeout_ms = 500, lsp_fallback = true }
		end,
		-----------------------------------------------------------
		-- Toggle formatOnSave Command
		-----------------------------------------------------------
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		}),
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		}),
	},
}
