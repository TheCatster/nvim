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
require("lsp")

-- Keymappings
require("keymappings")

-- Config
require("config.lualine")
require("config.colorscheme")
require("config.julia")

require("nvim-tree").setup()

vim.api.nvim_set_keymap('n', '<c-P>',
    "<cmd>lua require('fzf-lua').files()<CR>",
    { noremap = true, silent = true })

-- Old Config
vim.cmd(
    [[
" ===================
" # Plugin Settings #
" ===================

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" Hy
let g:hy_enable_conceal = 1

" JVM
let java_ignore_javadoc=1

" LaTeX
let g:latex_indent_enabled = 1
let g:latex_fold_envs = 0
let g:latex_fold_sections = []

" Golang
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_bin_path = expand("~/.local/share/go/bin")

" JS
let javaScript_fold=0

" Goyo
map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
]]
)
