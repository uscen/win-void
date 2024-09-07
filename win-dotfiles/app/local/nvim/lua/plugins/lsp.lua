-----------------------------------------------------------
-- Language Sever Porotocols
-----------------------------------------------------------
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		function on_attach(client, bufnr)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
			vim.keymap.set("n", "<leader>p", "<Cmd>LspStop<CR>", { buffer = bufnr })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr })
			vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references, { buffer = bufnr })
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = bufnr })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("lspconfig").bashls.setup({ on_attach = on_attach, capabilities = capabilities })
		require("lspconfig").pyright.setup({ on_attach = on_attach, capabilities = capabilities })
		require("lspconfig").lua_ls.setup({ on_attach = on_attach, capabilities = capabilities })
		require("lspconfig").html.setup({ on_attach = on_attach, capabilities = capabilities })
		require("lspconfig").cssls.setup({ on_attach = on_attach, capabilities = capabilities })
		-- require("lspconfig").ts_ls.setup({ on_attach = on_attach, capabilities = capabilities })
		require("lspconfig").emmet_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"css",
				"eruby",
				"html",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				"svelte",
				"pug",
				"typescriptreact",
				"vue",
			},
		})

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			-- Enable update diagnostics in insert mode
			update_in_insert = true,
		})

		local signs = {
			Error = "",
			Warn = "",
			Hint = "",
			Info = "ℹ️",
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end
	end,
}
