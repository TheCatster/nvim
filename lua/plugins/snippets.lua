return {
    {
        "L3MON4D3/LuaSnip",
        version = "2.*",
        build = "make install_jsregexp",
        dependencies = {
            { "saadparwaiz1/cmp_luasnip" },
        },
    },
    {
        "iurimateus/luasnip-latex-snippets.nvim",
        requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
        config = function()
            require "luasnip-latex-snippets".setup()
        end,
    }
}
