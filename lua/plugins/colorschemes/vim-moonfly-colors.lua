return {
	{
		lazy = false,
		priority = 1000,
		enabled = true,
		"bluz71/vim-moonfly-colors",
		init = function()
			vim.g.moonflyCursorColor = true -- default: false
			vim.g.moonflyItalics = false -- default: true
			vim.g.moonflyNormalFloat = true -- default: false
			vim.g.moonflyTerminalColors = true -- default: true
			vim.g.moonflyTransparent = true -- default: false
			vim.g.moonflyUndercurls = true -- default: true
			vim.g.moonflyUnderlineMatchParen = false -- default: false
			vim.g.moonflyVirtualTextColor = true -- default: false
			vim.g.moonflyWinSeparator = 2 -- default: 1
			vim.opt.fillchars:append({ eob = " " })
			vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
		end,
		config = function()
			vim.cmd([[colorscheme moonfly]])
		end,
	},
}
