return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").setup({
            ignore_install = { "latex" },
            ensure_installed = {
                "lua",
                "rust",
                "c",
                "python",
                "julia",
                "vim",
                "markdown",
                "markdown_inline",
                "bash",
                "cpp",
                "javascript",
                "typescript",
                "tsx",
                "json",
                "yaml",
                "toml",
                "regex",
                "go",
                "dockerfile",
                "zig",
            },
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "markdown" },
            },
            indent = { enable = true },
        })
    end,
}
