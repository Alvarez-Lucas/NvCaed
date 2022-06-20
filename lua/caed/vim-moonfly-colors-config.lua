-- require("vim-moonfly-colors-config")
vim.g.moonflyUnderlineMatchParen = 1 -- Love this, especially between ()
vim.g.moonflyItalics = 0
-- vim.g.moonflyCursorColor = 1 -- does not work
-- vim.g.moonflyNormalFloat = 1 -- makes it black/transparent / invisible, need border lines
vim.g.moonflyTransparent = 1 -- gonna try with something
-- disable transparent background if in neovide
vim.cmd([[ 
if exists('g:neovide')
  let g:moonflyTransparent = 0
en
]])
vim.g.moonflyWinSeparator = 2 -- makes it skinnier
vim.opt.fillchars = { -- makes it thicker but not as thick as disable thing above
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
}
