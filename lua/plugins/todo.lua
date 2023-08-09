return {
	"folke/todo-comments.nvim",
	cmd = { "TodoTelescope", "TodoLocList" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"<leader>ct",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next todo comment",
		},
		{ "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "List Todo in Telescope" },
	},
}
