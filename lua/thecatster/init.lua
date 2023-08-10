---------------
--- Keymaps ---
---------------

-- Save faster
vim.keymap.set("n", "<leader>w", ":w<CR>", { remap = true })

-- ; is more convenient
vim.keymap.set("n", ";", ":")

-----------
--- Set ---
-----------
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

------------
--- Misc ---
------------

-- Replace grep with ripgrep
if vim.fn.executable("rg") == 1 then
	vim.opt.grepprg = "rg --vimgrep"
end

-- Automatic commenting is annoying
vim.cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

-- Trailing whitespace is also annoying
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
vim.cmd([[autocmd BufWritepre * %s/\n\+\%$//e]])

-- Jump to previous editing position
vim.cmd(
	[[au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]
)

-- Highlight yanked
vim.cmd(
	[[autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=500}]]
)

-- Disable netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- System clipboard
vim.opt.clipboard = vim.opt.clipboard + "unnamedplus"

-- Wild Menu
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest", "list" }
vim.opt.wildignore:append({ ".hg", ".git", ".svn" })
vim.opt.wildignore:append({ "*.orig" })
vim.opt.wildignore:append({ "*.aux", "*.out", "*.toc" })
vim.opt.wildignore:append({ "*.bmp", "*.gif", "*.jpg", "*.jpeg", "*.png" })
vim.opt.wildignore:append({ "*.sw?" })
vim.opt.wildignore:append({ "*.DS_Store" })
vim.opt.wildignore:append({ "*/tmp/**" })
vim.opt.wildignore:append({ "*.o", "*.hi" })
