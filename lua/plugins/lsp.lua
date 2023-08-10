return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	lazy = false,
	dependencies = {
		-- Misc
		{ "nvim-treesitter/nvim-treesitter" },
		{ "nvim-tree/nvim-web-devicons" },

		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{ "folke/trouble.nvim" },
		{
			"ray-x/lsp_signature.nvim",
			event = "VeryLazy",
			opts = {},
		},
		{ "nvimdev/lspsaga.nvim", opts = {} },

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "folke/neodev.nvim" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-emoji" },
		{ "hrsh7th/cmp-cmdline" },
		{ "windwp/nvim-autopairs", lazy = false, event = "InsertEnter", opts = {} },
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
			"jsonls",
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

		local cmp = require("cmp")
		local lsp = require("lsp-zero")
		local cmp_action = require("lsp-zero").cmp_action()

		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<Tab>"] = cmp_action.luasnip_supertab(),
			["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
		})

		-- If you want insert `(` after select function or method item
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings,
		})

		cmp.setup({
			sources = {
				{ name = "nvim_lsp", group_index = 2 },
				{ name = "path", group_index = 2 },
				{ name = "luasnip", group_index = 2 },
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({
					-- documentation says this is important.
					-- I don't know why.
					behavior = cmp.ConfirmBehavior.Replace,
					select = false,
				}),
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
		})
	end,
}
