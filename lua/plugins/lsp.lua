return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },
        { "williamboman/mason.nvim" },
        { "williamboman/mason-lspconfig.nvim" },
        { "folke/trouble.nvim" },
        {
            "ray-x/lsp_signature.nvim",
            event = "VeryLazy",
            opts = {},
        },
        { "nvimdev/lspsaga.nvim",           opts = {} },
        { "nvim-treesitter/nvim-treesitter" },
        { "nvim-tree/nvim-web-devicons" },
        {
            "AckslD/nvim-FeMaco.lua",
            opts = {},
        },
        { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "L3MON4D3/LuaSnip" },
    },
    keys = {
        { "<leader>cm", "<cmd>Mason<cr>",  desc = "Mason" },
        { "<leader>cb", "<CMD>FeMaco<CR>", desc = "Evaluate Codeblock" },
        {
            "gd",
            function()
                vim.lsp.buf.definition()
            end,
            desc = "Go To Definition",
        },
        {
            "K",
            function()
                vim.lsp.buf.hover()
            end,
            desc = "Hover",
        },
        {
            "<leader>cs",
            function()
                vim.lsp.buf.workspace_symbol()
            end,
            desc = "Workspace Symbol",
        },
        {
            "<leader>cd",
            function()
                vim.lsp.buf.open_float()
            end,
            desc = "Open Float",
        },
        {
            "<leader>cd",
            function()
                vim.lsp.buf.open_float()
            end,
            desc = "Open Float",
        },
        {
            "<leader>c[",
            function()
                vim.diagnostic.goto_next()
            end,
            desc = "Go To Next Trouble",
        },
        {
            "<leader>c]",
            function()
                vim.diagnostic.goto_prev()
            end,
            desc = "Go To Previous Trouble",
        },
        {
            "<leader>ca",
            function()
                vim.lsp.buf.code_action()
            end,
            desc = "Code Action",
        },
        {
            "<leader>cr",
            function()
                vim.lsp.buf.references()
            end,
            desc = "References",
        },
        {
            "<leader>cn",
            function()
                vim.lsp.buf.rename()
            end,
            desc = "Rename Symbol",
        },
        {
            "<C-h>",
            function()
                vim.lsp.buf.signature_help()
            end,
            desc = "References",
            mode = "i",
        },
    },
    config = function()
        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        -- Using ufo provider need remap `zR` and `zM`.
        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

        require("ufo").setup({
            provider_selector = function(_, _, _)
                return { "treesitter", "indent" }
            end
        })

        vim.diagnostic.config({
            virtual_text = true,
        })

        local lsp_zero = require("lsp-zero")
        lsp_zero.extend_lspconfig()

        lsp_zero.on_attach(function(client, bufnr)
            lsp_zero.default_keymaps({ buffer = bufnr })
            lsp_zero.buffer_autoformat()
        end)

        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "asm_lsp",
                "bashls",
                "clangd",
                "docker_compose_language_service",
                "dockerls",
                "html",
                "jsonls",
                "julials",
                "lua_ls",
                "pyright",
                "rust_analyzer",
                "svls",
                "texlab",
                "zls",
            },
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require("lspconfig").lua_ls.setup(lua_opts)
                end,
            },
        })

        -- clangd fix
        local cmp_nvim_lsp = require "cmp_nvim_lsp"
        require("lspconfig").clangd.setup {
            capabilities = cmp_nvim_lsp.default_capabilities(),
            cmd = {
                "clangd",
                "--offset-encoding=utf-16",
            },
        }
    end,
}
