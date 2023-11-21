return {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "L3MON4D3/LuaSnip" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-emoji" },
        { "hrsh7th/cmp-cmdline" },
        { "windwp/nvim-autopairs", opts = {} },
        { "zbirenbaum/copilot.lua" },
        { "zbirenbaum/copilot-cmp" },
    },
    config = function()
        local cmp = require("cmp")

        require("copilot").setup({
            suggestion = { enabled = false },
            panel = { enabled = false },
        })

        require("copilot_cmp").setup()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = {
                { name = "copilot", group_index = 2 },
                { name = "nvim_lsp", group_index = 2 },
                { name = "path", group_index = 2 },
                { name = "luasnip", group_index = 2 },
                { name = "crates", group_index = 2 },
            },
        })

        -- If you want insert `(` after select function or method item
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}
