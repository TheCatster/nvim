return {
    "epwalsh/obsidian.nvim",
    event = { "BufReadPre " .. vim.fn.expand("~") .. "/Obsidian/My Vault/**.md" },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    opts = {},
    keys = {
        { "<leader>oo", "<cmd>ObsidianOpen<CR>", desc = "Obsidian Open" },
        { "<leader>on", "<cmd>ObsidianNew<CR>", desc = "Obsidian New" },
        { "<leader>of", "<cmd>ObsidianQuickSwitch<CR>", desc = "Obsidian Quick Switch" },
        { "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Obsidian Search" },
        { "<leader>ol", "<cmd>ObsidianFollowLink<CR>", desc = "Obsidian Follow Link" },
        { "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Obsidian Backlinks" },
        { "<leader>ot", "<cmd>ObsidianToday<CR>", desc = "Obsidian Today" },
        { "<leader>oy", "<cmd>ObsidianYesterday<CR>", desc = "Obsidian Yesterday" },
        { "<leader>op", "<cmd>ObsidianTemplate<CR>", desc = "Obsidian Template" },
        { "<leader>ok", "<cmd>ObsidianLink<CR>", desc = "Obsidian Link" },
        { "<leader>oa", "<cmd>ObsidianLinkNew<CR>", desc = "Obsidian Link New" },
    },
    config = function()
        require("obsidian").setup({
            dir = "~/Obsidian/My Vault",
            mappings = {
                ["fo"] = require("obsidian.mapping").gf_passthrough(),
            },
            note_frontmatter_func = function(note)
                -- This is equivalent to the default frontmatter function.
                local out = { id = note.id, tags = note.tags }
                -- `note.metadata` contains any manually added fields in the frontmatter.
                -- So here we just make sure those fields are kept in the frontmatter.
                if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
                    for k, v in pairs(note.metadata) do
                        out[k] = v
                    end
                end
                return out
            end,
        })
    end,
}
