-- TODO: move mapping to dedicated mapping file
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.keymaps")
require("config.options")
vim.cmd([[
packadd! dracula_pro

syntax enable

let g:dracula_colorterm = 0

colorscheme dracula_pro]])

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

require("lazy").setup("plugins")
