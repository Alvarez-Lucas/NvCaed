local vo = vim.opt
local vc = vim.cmd

-- TODO: Add more options from classic https://youtu.be/hY5-Q6NxQgY

-- Options --
--
local options = {}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Set clipboard for default register
vim.opt.clipboard:append("unnamedplus")

-- Removes the nvim splash screen
vo.shortmess:append({ I = true })

-- Buffer
vo.hidden = true

-- Line Numbers
vo.number = true
vo.relativenumber = true

-- Cursor Line
vo.cursorline = true

-- Sign Column
vo.signcolumn = "yes"

-- Colors
vo.termguicolors = true

-- Scroll off
vo.scrolloff = 8
vo.sidescrolloff = 8

-- Disable Mouse Input
vim.opt.mouse = ""

-- Global Status Line
vo.laststatus = 3

-- Command Height
-- vc([[set cmdheight=1]])
vim.opt.cmdheight = 1

-- Remove end of buffer character
vim.opt.fillchars:append({ eob = " " })

-- Make Keywords include "-"
vim.opt.iskeyword:append("-")

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

-- Temp Directory
vc([[
set directory=$HOME/.vim/tmp
]])

-- GUI Font
-- TODO: Move to neovide
vc([[set guifont=JetBrainsMono\ Nerd\ Font:h28]])
-- vc([[set guifont=JetBrainsMono\ NFM:h18]])
-- vc([[set guifont=JetBrainsMono\ NFM:h15]])
-- vc([[set guifont=Monaco\ NFM:h15]])
-- vc([[set guifont=Hack\ NFM:h15]])

-- Neovide
-- km("n", "<A-left>", ":set guifont=JetBrainsMono\\ NF:h15<cr>", defaultOpts)
-- vc([[set guifont=JetBrainsMono\ NF:h16]])
-- vc([[set guifont=FantasqueSansM\ Nerd\ Font:h20]])
-- Copy into system clipboard
--
