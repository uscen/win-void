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
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			svelte = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			graphql = { "prettierd" },
			lua = { "stylua" },
			terraform = { "terraform_fmt" },
			python = { "isort", "black" },
			["*"] = { "codespell" },
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		formatters = {
			injected = { options = { ignore_errors = true } },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		},
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
