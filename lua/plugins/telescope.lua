return {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        { "nvim-tree/nvim-web-devicons" },
        { "nvim-telescope/telescope-file-browser.nvim" },
        { "nvim-telescope/telescope-dap.nvim" },
        {
            "nvim-telescope/telescope-frecency.nvim",
            dependencies = { "kkharji/sqlite.lua" },
        },
        { "nvim-telescope/telescope-media-files.nvim" },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
        { "<leader>fs", "<cmd>Telescope live_grep<CR>", desc = "Find String" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find Buffers" },
        { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Find Projects" },
        { "<leader>fc", "<cmd>Telescope neoclip<CR>", desc = "Find Clipboard" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Help" },
        { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find Keymaps" },
        { "<leader>fd", "<cmd>Telescope dap<CR>", desc = "Debugger" },
        { "<leader>fq", "<cmd>Telescope frecency<CR>", desc = "Find Files by Frecency" },
        { "<leader>fm", "<cmd>Telescope media_files<CR>", desc = "View Media Files" },
        { "<leader>fe", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "File Explorer" },
    },
    opts = {
        defaults = {
            prompt_prefix = " ",
            selection_caret = " ",
            path_display = { "smart" },
            file_ignore_patterns = { ".git/", "node_modules", ".idea" },
        },
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = true, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            },
        },
    },
    config = function()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("projects")
        require("telescope").load_extension("neoclip")
        require("telescope").load_extension("dap")
        require("telescope").load_extension("frecency")
        require("telescope").load_extension("media_files")
    end,
}
