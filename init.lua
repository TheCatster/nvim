---@diagnostic disable: undefined-global
require("impatient")

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Basic Settings
require("settings")

-- Plugins
require("plugins")

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
