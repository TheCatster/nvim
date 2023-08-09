return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Add File" },
		{ "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "Remove File" },
		{ "<leader>he", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon Menu" },
		{ "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Next File" },
		{ "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Previous File" },
		{ "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "File 1" },
		{ "<leader>h2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "File 2" },
		{ "<leader>h3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "File 3" },
	},
}
