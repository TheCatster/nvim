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

        wk.register({
            f = {
                name = "find",
            },
            c = {
                name = "lsp",
            },
            g = {
                name = "git",
            },
            h = {
                name = "harpoon",
            },
            o = {
                name = "obsidian",
            },
        }, { prefix = "<leader>" })
    end,
}
