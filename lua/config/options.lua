-- Api Shorteners
local vo = vim.opt
local vc = vim.cmd

-- Options --

-- Buffer
vo.hidden = true

-- Line Numbers
vo.number = true
vo.relativenumber = true

-- Cursor Line
vo.cursorline = true

-- Indentation
vo.shiftwidth = 2
vo.tabstop = 2
vo.expandtab = true
vo.smarttab = true

-- Searching
vo.ignorecase = true
vo.smartcase = true
vo.hlsearch = true
vo.incsearch = true

-- Sign Column
vo.signcolumn = "yes"

-- Colors
vo.termguicolors = true

-- Column Marker
-- vc("set colorcolumn=80")

-- Make Keywords include "-"
vc("set iskeyword+=-")

-- Scroll off
vo.scrolloff = 8
vo.sidescrolloff = 8

-- Lightspeed disabled default maps
-- TODO: readd if using lightspeed
-- vim.g.lightspeed_no_default_keymaps = 0

-- Disable Mouse Input
vc("set mouse=")

-- GUI Font
-- vc([[set guifont=JetBrainsMono\ NFM:h18]])
vc([[set guifont=JetBrainsMono\ Nerd\ Font:h28]])
-- vc([[set guifont=JetBrainsMono\ NFM:h15]])
-- vc([[set guifont=Monaco\ NFM:h15]])
-- vc([[set guifont=Hack\ NFM:h15]])

-- Global Status Line
vo.laststatus = 3

-- Command Height
vc([[set cmdheight=1]])

-- Remove end of buffer character
vim.opt.fillchars:append({ eob = " " })

-- Temp Directory
vc([[
set directory=$HOME/.vim/tmp
]])

-- Neovide
-- km("n", "<A-left>", ":set guifont=JetBrainsMono\\ NF:h15<cr>", defaultOpts)
-- vc([[set guifont=JetBrainsMono\ NF:h16]])
-- vc([[set guifont=FantasqueSansM\ Nerd\ Font:h20]])
