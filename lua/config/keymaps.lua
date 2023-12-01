-- api shorteners
local defaultOpts = { noremap = true, silent = true }
local km = vim.api.nvim_set_keymap
local vc = vim.cmd

-- Local leaders
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- TODO: Leader Key might not need
-- km("", "<Space>", "Nop", defaultOpts)

-- Normal Mode Keymaps --
km("n", "<C-Up>", ":resize -2<CR>", defaultOpts)
km("n", "<C-Down>", ":resize +2<CR>", defaultOpts)
km("n", "<C-Left>", ":vertical resize -2<CR>", defaultOpts)
km("n", "<C-Right>", ":vertical resize +2<CR>", defaultOpts)

-- veritcal and horizontal split
km("n", "<leader>|", ":vsplit<CR><C-w>l", defaultOpts)
km("n", "<leader>-", ":split<CR><C-w>j", defaultOpts)

-- Keep Buffer After Paste
km("v", "p", '"_dP', defaultOpts)

-- Jump to last visual selection
-- km("n", "gV", "[v]", defaultOpts)

-- rebind the command mode
-- km("n", ";", ":", { noremap = true, silent = false })
-- km("n", ":", ";", { noremap = true, silent = false })

-- Make Y yank to end of line
-- km("v", "Y", "y$", defaultOpts)

-- Surround shortcut
--km("v", "<leader>a", "S", defaultOptsj
--
-- lightspeed
-- vim.api.nvim_set_keymap("n", "<leader>j", "<Plug>Lightspeed_omni_s", { noremap = false })

-- Navigate Buffer
-- km("n", "<S-l>", ":bnext<CR>", defaultOpts)
-- km("n", "<S-h>", ":bprevious<CR>", defaultOpts)
-- km("n", "<A-l>", ":BufferLineMoveNext<CR>", defaultOpts)
-- km("n", "<A-h>", ":BufferLineMovePrev<CR>", defaultOpts)

-- BufferLine TODO: readd if adding bufferline back
-- km("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>", defaultOpts)
-- km("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>", defaultOpts)
-- km("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>", defaultOpts)
-- km("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>", defaultOpts)
-- km("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>", defaultOpts)
-- km("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>", defaultOpts)
-- km("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>", defaultOpts)
-- km("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>", defaultOpts)
-- km("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>", defaultOpts)

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

-- leave terminal mode
km("t", "<Esc>", "<C-\\><C-N>", defaultOpts)

-- Move Text
km("x", "J", ":move '>+1<CR>gv-gv", defaultOpts)
km("x", "K", ":move '<-2<CR>gv-gv", defaultOpts)
km("x", "<A-j>", ":move '>+1<CR>gv-gv", defaultOpts)
km("x", "<A-k>", ":move '<-2<CR>gv-gv", defaultOpts)

-- Keep Selection After Indent
vc(":vnoremap < <gv")
vc(":vnoremap > >gv")

-- -- Telescope
-- km("n", "<leader>f", "<cmd>Telescope find_files<cr>", defaultOpts)
-- -- TODO: Readd if doing bookmarks
-- -- km("n", "<leader>b", "<cmd>Telescope bookmarks theme=dropdown<cr>", defaultOpts)
-- -- TODO: This was already commented unsure
-- -- km("n", "<leader>fb", "<cmd>Telescope buffers<cr>", defaultOpts)
-- km("n", "<leader>h", "<cmd>Telescope help_tags<cr>", defaultOpts)
-- -- TODO: Readd
-- -- km("n", "<leader>z", "<cmd>Telescope zoxide list theme=dropdown<cr>", defaultOpts)
-- km("n", "<leader>t", "<cmd>Telescope buffers<cr>", defaultOpts)
-- km("n", "<leader>g", "<cmd>Telescope live_grep<cr>", defaultOpts)
-- km("n", "<C-p>", "<cmd>Telescope commands theme=dropdown<cr>", defaultOpts)
-- km("n", "<leader>F", "<cmd>Telescope current_buffer_fuzzy_find<cr>", defaultOpts)

km("n", "<leader>l", "<cmd>Lazy<cr>", defaultOpts)

-- Vimwiki TODO: Readd
-- km("n", ",", "<cmd>VimwikiToggleListItem<cr>", defaultOpts)
-- km("v", ",", "<cmd>VimwikiToggleListItem<cr>", defaultOpts)
-- km("n", "<leader>ww", "<cmd>cd $HOME/vimwiki<cr><cmd>VimwikiIndex<cr>", defaultOpts)
-- km("n", "<leader>wf", "<cmd>cd $HOME/vimwiki<cr><cmd>Telescope find_files<cr>", defaultOpts)

-- Nvim Tree
km("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", defaultOpts)

-- TODO: Close Buffer, w/ save ?
-- TODO: Readd
-- km("n", "<leader>d", "<cmd>Bdelete<cr>", defaultOpts)

-- Copy into system clipboard
vc("set clipboard+=unnamedplus")

-- Save File and Code Runner and Mark down previewer and Markmap
-- TODO Readd, might not need the same thing for mark down previewer if using LSP for it
-- vc("autocmd FileType markdown nmap <buffer><leader>r <cmd>CocCommand markdown-preview-enhanced.openPreview<cr>")
-- vc("autocmd FileType vimwiki nmap <buffer><leader>r <cmd>CocCommand markdown-preview-enhanced.openPreview<cr>")
-- km("n", "<leader>m", "<cmd>CocCommand markmap.create<cr>", defaultOpts)

-- Save File
km("n", "<C-s>", "<cmd>w<cr>", defaultOpts)
km("n", "<leader>s", "<cmd>w<cr>", defaultOpts)

-- CocCurrentWordToggle
-- Replace with LSP Equivalent
-- km("n", "<leader>ch", "<cmd>CocCurrentWordToggle<cr>", defaultOpts)

-- Clear Highlights
km("n", "<Esc>", "<cmd>nohlsearch<cr>", defaultOpts)

-- Neovide TODO: Read if considering neovide
-- Change Font Size
-- km("n", "<A-left>", ":set guifont=JetBrainsMono\\ NF:h15<cr>", defaultOpts)
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
km("n", "<F11>", "<cmd>NeovideToggleFullscreen<cr>", defaultOpts)
vim.cmd([[command -nargs=0 NeovideToggleFullscreen :let g:neovide_fullscreen = !g:neovide_fullscreen]])

-- Change current working directory to file location
km("n", "<leader>z", ":cd %:p:h<CR>:pwd<CR>", defaultOpts)
