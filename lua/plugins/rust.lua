return {
	"simrat39/rust-tools.nvim",
    lazy = true,
	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "nvim-lua/plenary.nvim" },
		{ "mfussenegger/nvim-dap" },
		{
			"saecki/crates.nvim",
			tag = "v0.3.0",
			opts = {},
		},
	},
	config = function()
		local rt = require("rust-tools")

		rt.setup({
			server = {
				on_attach = function(_, bufnr)
					-- Hover actions
					vim.keymap.set("n", "<leader>ch", rt.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
			},
		})
	end,
}
