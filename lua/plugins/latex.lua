return {
    "lervag/vimtex",
    lazy = false,
    config = function()
        vim.api.nvim_create_autocmd({ "FileType" }, {
            group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
            pattern = { "bib", "tex" },
            callback = function()
                vim.wo.conceallevel = 2
            end,
        })

        vim.g.vimtex_syntax_enabled = 0
        vim.g.vimtex_compiler_method = "tectonic"
        vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
        vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
    end,
}
