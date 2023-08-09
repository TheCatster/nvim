vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable the new |lua-loader| that byte-compiles and caches lua files.
vim.loader.enable()

-- Install package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Source packages
require("lazy").setup("plugins", {
	install = {
		missing = true,
		colorscheme = { "catppuccin" },
	},
})

-- Source personal config
require("thecatster")
