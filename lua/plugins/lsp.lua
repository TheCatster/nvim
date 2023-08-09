return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	lazy = false,
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "folke/trouble.nvim" },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "folke/neodev.nvim" },
	},
	keys = {
		{ "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" },
	},
	config = function()
		local lsp = require("lsp-zero")

		lsp.preset("recommended")

		lsp.ensure_installed({
			"asm_lsp",
			"bashls",
			"clangd",
			"docker_compose_language_service",
			"dockerls",
			"html",
			"julials",
			"lua_ls",
			"pyright",
			"rust_analyzer",
			"svls",
			"texlab",
			"tsserver",
			--"zls",
		})

		lsp.nvim_workspace()

		lsp.set_preferences({
			suggest_lsp_servers = false,
			sign_icons = {
				error = "E",
				warn = "W",
				hint = "H",
				info = "I",
			},
		})

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>cws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>cd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>cr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<leader>cn", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
		end)

		lsp.setup()

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
