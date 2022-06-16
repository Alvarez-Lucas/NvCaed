-- api shorteners
local defaultOpts = { noremap = true, silent = true }
local km = vim.api.nvim_set_keymap
local vc = vim.cmd

-- Leader Key
-- km("", "<Space>", "Nop", defaultOpts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode Keymaps --
km("n", "<C-Up>", ":resize -2<CR>", defaultOpts)
km("n", "<C-Down>", ":resize +2<CR>", defaultOpts)
km("n", "<C-Left>", ":vertical resize -2<CR>", defaultOpts)
km("n", "<C-Right>", ":vertical resize +2<CR>", defaultOpts)

-- Keep Buffer After Paste
km("v", "p", '"_dP', defaultOpts)

-- Surround shortcut
--km("v", "<leader>a", "S", defaultOpts)

-- Navigate Buffer
km("n", "<S-l>", ":bnext<CR>", defaultOpts)
km("n", "<S-h>", ":bprevious<CR>", defaultOpts)
km("n", "<A-l>", ":BufferLineMoveNext<CR>", defaultOpts)
km("n", "<A-h>", ":BufferLineMovePrev<CR>", defaultOpts)

-- Shorten Window Navigation
km("n", "<C-h>", "<C-w>h", defaultOpts)
km("n", "<C-j>", "<C-w>j", defaultOpts)
km("n", "<C-k>", "<C-w>k", defaultOpts)
km("n", "<C-l>", "<C-w>l", defaultOpts)

-- Better Terminal Navigation
km("t", "<C-h>", "<C-\\><C-N><C-w>h", defaultOpts)
km("t", "<C-j>", "<C-\\><C-N><C-w>j", defaultOpts)
km("t", "<C-k>", "<C-\\><C-N><C-w>k", defaultOpts)
km("t", "<C-l>", "<C-\\><C-N><C-w>l", defaultOpts)

-- Move Text
km("x", "J", ":move '>+1<CR>gv-gv", defaultOpts)
km("x", "K", ":move '<-2<CR>gv-gv", defaultOpts)
km("x", "<A-j>", ":move '>+1<CR>gv-gv", defaultOpts)
km("x", "<A-k>", ":move '<-2<CR>gv-gv", defaultOpts)

-- Keep Selection After Indent
vc(":vnoremap < <gv")
vc(":vnoremap > >gv")

-- Telescope
km("n", "<leader>f", "<cmd>Telescope find_files<cr>", defaultOpts)
km("n", "<leader>b", "<cmd>Telescope bookmarks theme=dropdown<cr>", defaultOpts)
-- km("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", defaultOpts)
-- km("n", "<leader>fb", "<cmd>Telescope buffers<cr>", defaultOpts)
-- km("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", defaultOpts)
km("n", "<leader>z", "<cmd>Telescope zoxide list theme=dropdown<cr>", defaultOpts)
km("n", "<leader><tab>", "<cmd>Telescope buffers<cr>", defaultOpts)
km("n", "<leader>g", "<cmd>Telescope live_grep<cr>", defaultOpts)
km("n", "<C-p>", "<cmd>Telescope commands theme=dropdown<cr>", defaultOpts)

-- Vimwiki
km("n", "<leader>ww", "<cmd>cd $HOME/vimwiki<cr><cmd>VimwikiIndex<cr>", defaultOpts)
km("n", "<leader>wf", "<cmd>cd $HOME/vimwiki<cr><cmd>Telescope find_files<cr>", defaultOpts)

-- Nvim Tree
km("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", defaultOpts)

-- TODO: Close Buffer, w/ save ?
km("n", "<leader>d", "<cmd>Bdelete<cr>", defaultOpts)

-- Copy into system clipboard
vc("set clipboard+=unnamedplus")

-- Save File and Code Runner
km("n", "<leader>r", "<cmd>w<cr><cmd>RunCode<cr>", defaultOpts)

-- Save File
km("n", "<C-s>", "<cmd>w<cr>", defaultOpts)
km("n", "<leader>s", "<cmd>w<cr>", defaultOpts)

-- CocCurrentWordToggle
km("n", "<leader>ch", "<cmd>CocCurrentWordToggle<cr>", defaultOpts)

-- Clear Highlights
km("n", "<Esc>", "<cmd>nohlsearch<cr>", defaultOpts)

-- Neovide

-- Change Font Size
km("n", "<A-left>", ":set guifont=JetBrainsMono\\ NF:h15<cr>", defaultOpts)
vc([[
nnoremap <A-Up> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)+1)',
 \ '')<CR>

nnoremap <A-Down> :silent! let &guifont = substitute(
 \ &guifont,
 \ ':h\zs\d\+',
 \ '\=eval(submatch(0)-1)',
 \ '')<CR>
]])

-- Toggle Full Screen
km("n", "<F11>", ":let g:neovide_fullscreen=v:", defaultOpts)

-- Packer
km("n", "<leader>pc", "<cmd>PackerCompile<cr>", defaultOpts)
km("n", "<leader>ps", "<cmd>PackerSync<cr>", defaultOpts)
km("n", "<leader>pi", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>", defaultOpts)
