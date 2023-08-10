return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	opts = {
		sections = {
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
