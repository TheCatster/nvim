return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = {
		winbar = {
			lualine_c = {
				{
					"navic",
					color_correction = nil,
					navic_opts = nil,
				},
			},
		},
	},
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
	},
}
