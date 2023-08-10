return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "L3MON4D3/LuaSnip" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-emoji" },
		{ "hrsh7th/cmp-cmdline" },
		{ "windwp/nvim-autopairs", opts = {} },
		{ "zbirenbaum/copilot.lua" },
		{ "zbirenbaum/copilot-cmp" },
	},
	config = function()
		local cmp = require("cmp")

		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})

		require("copilot_cmp").setup()

		cmp.setup({
			sources = {
				{ name = "copilot", group_index = 2 },
				{ name = "nvim_lsp", group_index = 2 },
				{ name = "path", group_index = 2 },
				{ name = "luasnip", group_index = 2 },
				{ name = "crates", group_index = 2 },
			},
			mapping = {
				["<CR>"] = require("cmp").mapping.confirm({
					-- documentation says this is important.
					-- I don't know why.
					behavior = require("cmp").ConfirmBehavior.Replace,
					select = false,
				}),
			},
		})

		-- If you want insert `(` after select function or method item
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
