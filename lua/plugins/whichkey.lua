return {
    "folke/which-key.nvim",
    opts = {
        key_labels = {
            ["<space>"] = "SPC",
            ["<cr>"] = "RET",
            ["<tab>"] = "TAB",
        },
    },
    lazy = false,
    config = function()
        local wk = require("which-key")

        wk.add({
            {
                "<leader>f",
                group = "find",
            },
            {
                "<leader>c",
                group = "lsp",
            },
            {
                "<leader>g",
                group = "git",
            },
            {
                "<leader>h",
                group = "harpoon",
            }
        })
    end,
}
