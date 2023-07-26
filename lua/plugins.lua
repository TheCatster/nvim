---@diagnostic disable: undefined-global
-- TODO: Find Lua alternatives to all

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
  function()
    -- Packer self-update
    use "wbthomason/packer.nvim"

    -- Optimize startup
    use "lewis6991/impatient.nvim"

    -- Treesitter!
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "andymass/vim-matchup", event = "VimEnter" }
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "p00f/nvim-ts-rainbow"
    use "rstacruz/vim-closer"
    use {
      "RRethy/nvim-treesitter-endwise",
      wants = "nvim-treesitter",
      event = "InsertEnter"
    }
    use {
      "windwp/nvim-autopairs",
      wants = "nvim-treesitter",
      module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
      config = function()
        require("nvim-autopairs").setup()
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
      end
    }
    use {
      "windwp/nvim-ts-autotag",
      wants = "nvim-treesitter",
      event = "InsertEnter",
      config = function()
        require("nvim-ts-autotag").setup { enable = true }
      end
    }
    use {
      "lewis6991/spellsitter.nvim",
      config = function()
        require("spellsitter").setup()
      end
    }

    -- Magit, but in Neovim
    use { "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" }
    use {
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end
    }

    -- Group comment in Lua
    use {
      "terrortylor/nvim-comment",
      config = function()
        require("nvim_comment").setup()
      end
    }
    use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function() require("todo-comments").setup() end,
    }

    -- Clipboard manager
    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    }

    -- Amazing version of vim surround (sadly not Lua)
    use "machakann/vim-sandwich"

    -- Universal editor configs
    use "gpanders/editorconfig.nvim"

    -- Next-next-gen vim sneak
    use {
      "ggandor/leap.nvim",
      requires = {
        "tpope/vim-repeat"
      }
    }

    -- Modeline in Lua
    use {
      "nvim-lualine/lualine.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons"
      }
    }

    -- My favorite colourscheme
    use {
      "navarasu/onedark.nvim",
      config = function()
        require("onedark").setup({
          style = "dark"
        })
      end
    }

    -- Lua file explorer
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons"
      },
      tag = "nightly",
      config = function()
        require("nvim-tree").setup()
      end
    }

    -- Telescope fuzzy finder
    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
      config = function()
        require("telescope").setup {
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = "smart_case",
            }
          }
        }
      end
    }
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    }
    use "nvim-telescope/telescope-media-files.nvim"
    use "nvim-telescope/telescope-project.nvim"
    use "nvim-telescope/telescope-ui-select.nvim"

    -- Kick off builds asynchronously
    use { "tpope/vim-dispatch", opt = true, cmd = { "Dispatch", "Make", "Focus", "Start" } }

    -- LSP
    use {
      "junnplus/lsp-setup.nvim",
      requires = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "glepnir/lspsaga.nvim"
      }
    }
    use { "ahmedkhalf/lsp-rooter.nvim", config = function() require("lsp-rooter").setup {} end }
    use "onsails/lspkind-nvim"
    use "folke/lsp-trouble.nvim"
    use "code-biscuits/nvim-biscuits"
    use "kevinhwang91/nvim-bqf"
    use "ray-x/lsp_signature.nvim"

    -- Autocomplete and snippets
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"

    -- Emacs-style dashboard
    use "glepnir/dashboard-nvim"

    -- DAP (Debugger) Support
    use "mfussenegger/nvim-dap"

    -- See colours, fast
    use { "RRethy/vim-hexokinase", run = "make hexokinase" }

    -- ################ --
    -- Language Support --
    -- ################ --

    -- Data Formats
    use "kevinoid/vim-jsonc"
    use "cespare/vim-toml"
    use "stephpy/vim-yaml"
    use {
      "nvim-orgmode/orgmode",
      config = function()
        require("orgmode").setup_ts_grammar()
        require("orgmode").setup {
          org_agenda_files = { '~/Nextcloud/org/*' },
          org_default_notes_file = '~/Nextcloud/org/todo.org',
        }
      end
    }

    -- Rust
    use "rust-lang/rust.vim"
    use {
      "simrat39/rust-tools.nvim",
      config = function()
        require("rust-tools").setup({})
      end
    }

    -- LISPs
    use "Olical/conjure"
    use "PaterJason/cmp-conjure"
    use {
      "eraserhd/parinfer-rust",
      run = "cargo build --release"
    }

    use "JuliaEditorSupport/julia-vim"
    use "hylang/vim-hy"
    use "rhysd/vim-clang-format"
    use "stevearc/vim-arduino"
    use "fatih/vim-go"

    -- LaTeX Setup
    use {
      "KeitaNakamura/tex-conceal.vim",
      run = function()
        vim.api.nvim_set_var("tex_conceal", "abdmg")
        vim.api.nvim_set_option("conceallevel", 1)
      end
    }

    use "lervag/vimtex"
  end
)
