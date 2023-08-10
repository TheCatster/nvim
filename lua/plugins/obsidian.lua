return {
	"epwalsh/obsidian.nvim",
	event = { "BufReadPre " .. vim.fn.expand("~") .. "/Obsidian/My Vault/**.md" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		dir = "~/Obsidian/My Vault",
	},
	keys = {
		{ "<leader>oo", "<cmd>ObsidianOpen<CR>", desc = "Obsidian Open" },
		{ "<leader>on", "<cmd>ObsidianNew<CR>", desc = "Obsidian New" },
		{ "<leader>of", "<cmd>ObsidianQuickSwitch<CR>", desc = "Obsidian Quick Switch" },
		{ "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Obsidian Search" },
	},
}
