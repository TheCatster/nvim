return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-emoji" },
		{ "hrsh7th/cmp-cmdline" },

		-- Copilot
		{ "zbirenbaum/copilot.lua" },
		{ "zbirenbaum/copilot-cmp" },

		-- Autopairs
		{ "windwp/nvim-autopairs", lazy = false, event = "InsertEnter", opts = {} },
	},
	config = function()
		local cmp = require("cmp")
		local lsp = require("lsp-zero")

		local cmp_select = { behavior = cmp.SelectBehavior.Select }
		local cmp_mappings = lsp.defaults.cmp_mappings({
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-y>"] = cmp.mapping.confirm({ select = true }),
			["<C-Space>"] = cmp.mapping.complete(),
		})

		-- If you want insert `(` after select function or method item
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp_mappings["<Tab>"] = nil
		cmp_mappings["<S-Tab>"] = nil

		lsp.setup_nvim_cmp({
			mapping = cmp_mappings,
		})

		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
		require("copilot_cmp").setup()

		cmp.setup({
			sources = {
				{ name = "copilot" },
				{ name = "nvim_lsp" },
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
	end,
}
