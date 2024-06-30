-- TODO: Add more options from classic https://youtu.be/hY5-Q6NxQgY

local optionsSet = {
	hidden = true,
	number = true, -- Line Numbers
	relativenumber = true, -- Relative line numbers
	cursorline = true, -- Cursor Line
	signcolumn = "yes", -- Sign Column
	termguicolors = true, -- Colors
	scrolloff = 8, -- Scroll off
	sidescrolloff = 8, -- Scroll off
	mouse = "", -- Disable Mouse Input
	laststatus = 3, -- Global Status Line
	cmdheight = 1, -- Command Height
	shiftwidth = 2, -- Indentation
	tabstop = 2, -- Indentation
	expandtab = true, -- Indentation
	smarttab = true, -- Indentation
	ignorecase = true, -- Searching
	smartcase = true, -- Searching
	hlsearch = true, -- Searching
	incsearch = true, -- Searching
	showmode = false,
	undofile = true,
	splitbelow = true,
	splitright = true,
	updatetime = 300,
	termguicolors = true,
	shortmess = "",
	inccommand = "split", -- replacing now has a fancy ui
}

local optionsAppend = {
	clipboard = "unnamedplus", -- Set clipboard for default register
	fillchars = { eob = " " }, -- Remove end of buffer character
	iskeyword = "-", -- Make Keywords include "-"
	shortmess = { I = true }, -- Removes the nvim splash screen
}

-- Temp Directory
vim.cmd([[
set directory=$HOME/.vim/tmp
]])
-- GUI Font
-- TODO: Move to neovide
vim.cmd([[set guifont=JetBrainsMono\ Nerd\ Font:h28]])
-- vc([[set guifont=JetBrainsMono\ NFM:h18]])
-- vc([[set guifont=JetBrainsMono\ NFM:h15]])
-- vc([[set guifont=Monaco\ NFM:h15]])
-- vc([[set guifont=Hack\ NFM:h15]])

-- Neovide
-- km("n", "<A-left>", ":set guifont=JetBrainsMono\\ NF:h15<cr>", defaultOpts)
-- vc([[set guifont=JetBrainsMono\ NF:h16]])
-- vc([[set guifont=FantasqueSansM\ Nerd\ Font:h20]])
-- Copy into system clipboard

for k, v in pairs(optionsSet) do
	vim.opt[k] = v
end

for k, v in pairs(optionsAppend) do
	vim.opt[k]:append(v)
end
