---@diagnostic disable: undefined-global
-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Plugins
require("plugins")
-- require("impatient")

-- Basic Settings
require("settings")

-- LSP
require("config.lsp")

-- Keymappings
require("keymappings")

-- Config
require("config.lualine")
require("config.julia")
require("config.treesitter")
require("config.julia")
require("config.rust")
require("config.hy")
require("config.go")
require("config.js")
require("config.arduino")
require("config.dashboard")
require("config.autocomplete")
require("config.luasnip")
