-- TODO: Find Lua alternatives to all

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function()
        -- Packer self-update
        use "wbthomason/packer.nvim"

        -- Optimize startup
        use "lewis6991/impatient.nvim"

        -- Treesitter interface for Neovim
        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

        -- Magit, but in Neovim
        use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

        -- Core improvements
        use "tpope/vim-fugitive"
        use "tpope/vim-commentary"
        use "lukesmithxyz/vimling"
        use "tpope/vim-surround"
        use "junegunn/goyo.vim"
        use "editorconfig/editorconfig-vim"
        use "justinmk/vim-sneak"

        -- Modeline in Lua
        use {
            "nvim-lualine/lualine.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons"
            }
        }

        -- My favorite colorscheme
        use "navarasu/onedark.nvim"

        -- Lua file explorer
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons"
            },
            tag = "nightly"
        }

        use "machakann/vim-highlightedyank"
        use {"andymass/vim-matchup", event = "VimEnter"}

        -- Close parentheses and statements
        use "rstacruz/vim-closer"
        use {
            "RRethy/nvim-treesitter-endwise",
            wants = "nvim-treesitter",
            event = "InsertEnter"
        }

        -- Fuzzy Finder
        use "airblade/vim-rooter"
        use {
            "ibhagwan/fzf-lua",
            requires = {"kyazdani42/nvim-web-devicons"}
        }

        -- Kick off builds asynchronously
        use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}}

        -- LSP Setup
        use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client
        use "hrsh7th/nvim-cmp" -- Autocompletion plugin
        use "hrsh7th/cmp-nvim-lsp" -- LSP source for nvim-cmp
        use "saadparwaiz1/cmp_luasnip" -- Snippets source for nvim-cmp
        use "L3MON4D3/LuaSnip" -- Snippets plugin

        -- DAP (Debugger) Support
        use "mfussenegger/nvim-dap"

        -- Alternative to Emacs Everywhere (and cleaner imho)
        use {
            "glacambre/firenvim",
            run = function()
                vim.fn["firenvim#install"](0)
            end
        }

        -- Web Development
        use "rstacruz/vim-hyperstyle"
        use "ap/vim-css-color"

        -- Data Formats
        use "kevinoid/vim-jsonc"
        use "cespare/vim-toml"
        use "stephpy/vim-yaml"
        use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install", cmd = "MarkdownPreview"}

        -- Language Support
        use "rust-lang/rust.vim"
        use "JuliaEditorSupport/julia-vim"
        use "hylang/vim-hy"
        use "rhysd/vim-clang-format"
        use "stevearc/vim-arduino"
        use "fatih/vim-go"

        -- Auto Pairs
        use {
            "windwp/nvim-autopairs",
            wants = "nvim-treesitter",
            module = {"nvim-autopairs.completion.cmp", "nvim-autopairs"},
            config = function()
                require("config.autopairs").setup()
            end
        }

        -- Auto Tag
        use {
            "windwp/nvim-ts-autotag",
            wants = "nvim-treesitter",
            event = "InsertEnter",
            config = function()
                require("nvim-ts-autotag").setup {enable = true}
            end
        }

        -- LaTeX Setup
        use {
            "KeitaNakamura/tex-conceal.vim",
            run = function()
                vim.api.nvim_set_var("tex_conceal", "abdmg")
                vim.api.nvim_set_option("conceallevel", 1)
            end
        }
    end
)
