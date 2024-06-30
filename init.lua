-- Local leaders
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options
require("config.options")
require("config.autocommands")

-- Boot strap lazy
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

-- Lazy load keymaps
local group = vim.api.nvim_create_augroup("LazyVim", { clear = true })
vim.api.nvim_create_autocmd("User", {
	group = group,
	pattern = "VeryLazy",
	callback = function()
		require("config.keymaps")
	end,
})

-- LazyLoad plugins
require("lazy").setup({
	{ import = "plugins.colorschemes-light" },
	{ import = "plugins" },
	{ import = "plugins.lsp-linting-formatting" },
})
