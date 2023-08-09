return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"lua",
				"rust",
				"c",
				"python",
				"julia",
				"vim",
				"markdown",
				"markdown_inline",
				"latex",
				"bash",
				"cpp",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"json",
				"yaml",
				"toml",
				"regex",
				"go",
				"dockerfile",
				"zig",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
