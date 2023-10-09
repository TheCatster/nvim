return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "sindrets/diffview.nvim",
    },
    opts = {},
    keys = {
        { "<leader>gs", "<cmd>Neogit<CR>", desc = "Neogit" },
    },
    config = true,
}
