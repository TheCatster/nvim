return {
	"AckslD/nvim-neoclip.lua",
	lazy = false,
	dependencies = {
		{ "kkharji/sqlite.lua", module = "sqlite" },
		{ "nvim-telescope/telescope.nvim" },
	},
	opts = {
		continuous_sync = true,
		enable_persistent_history = true,
	},
}
