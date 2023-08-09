return {
	"SmiteshP/nvim-navic",
	lazy = false,
	opts = {
		lsp = {
			auto_attach = true,
		},
	},
	dependencies = {
		{ "neovim/nvim-lspconfig" },
	},
}
