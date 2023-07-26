-- Shortcuts
local cmd = vim.cmd
local opt = vim.opt
local opt_local = vim.opt_local
local g = vim.g
local o = vim.o
local bo = vim.bo
local fn = vim.fn

-- Use already open buffers and write
opt.autowrite = true
opt.switchbuf = "useopen"

-- Indentation
cmd("filetype plugin indent on")
opt.expandtab = true
opt.shiftround = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true

-- Switch to Lua filetype detection
g.do_filetype_lua = 1
g.did_load_filetypes = 0

-- Spellcheck
opt_local.spell = false
opt.spelllang = "en_us"

-- Auto format on save
cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- Automatic commenting is annoying
cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

-- Trailing whitespace is also annoying
cmd([[autocmd BufWritePre * %s/\s\+$//e]])
cmd([[autocmd BufWritepre * %s/\n\+\%$//e]])

-- Jump to previous editing position
cmd([[au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

-- Highlight yanked
cmd([[autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=500}]])

-- Mouse support
opt.mouse = "a"

-- Better motion
opt.go = "a"

-- Search
opt.incsearch = true
opt.showmatch = true
opt.tags:append('.git/tags')
opt.ignorecase = true
opt.smartcase = true
opt.gdefault = true

-- List chars are cool
opt.listchars = "nbsp:¬,extends:»,precedes:«,trail:•"

-- Colorscheme
require("onedark").load()

-- Telescope extensions
require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")

-- Interface
cmd("syntax enable")
opt.synmaxcol = 500
opt.cmdheight = 2
opt.cursorline = true
opt.foldmethod = "marker"
opt.lazyredraw = true
opt.showmode = false
opt.ruler = true
opt.number = true
opt.relativenumber = true
opt.numberwidth = 5
opt.scrolloff = 2
opt.showcmd = true
opt.hlsearch = false
opt.splitbelow = true
opt.splitright = true
opt.title = true
opt.winwidth = 78
opt.updatetime = 300
opt.timeoutlen = 282
opt.guicursor = [[n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor]]
opt.inccommand = "nosplit"
opt.vb = true
opt.backspace = "2"
opt.foldenable = false
opt.ttyfast = true
opt.laststatus = 2
opt.shortmess = opt.shortmess + "c"
opt.colorcolumn = ""

-- Colours
o.background = "dark"
g.base16colorspace = 256
opt.termguicolors = true

if not fn.has("gui_running") then
  opt.t_Co = 256
end

-- Diff setup
opt.diffopt:append({ "iwhite" })
opt.diffopt:append({ "algorithm:patience" })
opt.diffopt:append({ "indent-heuristic" })

-- Wrapping
bo.formatoptions = "tcrqnb"
opt.wrap = true
opt.linebreak = true

-- System clipboard
opt.clipboard = opt.clipboard + "unnamedplus"

-- UTF-8
opt.encoding = "utf-8"

-- Set a bunch of stuff
opt.hidden = true

-- Backups and Undos
opt.backup = true
opt.backupdir = fn.expand("~/.local/share/nvim/backup/")
opt.backupskip = { '/tmp/*', '/private/tmp/*' }
opt.swapfile = false
opt.undofile = true
opt.undodir = fn.expand("~/.local/share/nvim/undo/")

-- Wild Menu
opt.wildmenu = true
opt.wildmode = { 'longest', 'list' }
opt.wildignore:append({ '.hg', '.git', '.svn' })
opt.wildignore:append({ '*.orig' })
opt.wildignore:append({ '*.aux', '*.out', '*.toc' })
opt.wildignore:append({ '*.bmp', '*.gif', '*.jpg', '*.jpeg', '*.png' })
opt.wildignore:append({ '*.sw?' })
opt.wildignore:append({ '*.DS_Store' })
opt.wildignore:append({ '*/tmp/**' })
opt.wildignore:append({ "*.o", "*.hi" })

-- Python
g.python3_host_prog = "/Users/danya/.pyenv/shims/python"
