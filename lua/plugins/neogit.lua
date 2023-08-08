return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
	},
	keys = {
		{"<leader>gs", "<cmd>Neogit<CR>", desc = "Git"},
	},
	config = true
}

