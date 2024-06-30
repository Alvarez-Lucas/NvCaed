-- api shorteners
local defaultOpts = { noremap = true, silent = true }
local km = vim.api.nvim_set_keymap
local vc = vim.cmd

-- Trying these out, switching buffers
-- Similar to default bufferline plugins
-- km("n", "<Tab>", "<cmd>bprevious<cr>", defaultOpts)
-- km("n", "<S-Tab>", "<cmd>bnext<cr>", defaultOpts)

km("n", "<c-d>", "<c-d>zz", defaultOpts)
km("n", "<c-u>", "<c-u>zz", defaultOpts)

-- Delete a buffer
km("", "<leader>d", "<cmd>bdelete<cr>", defaultOpts)

-- Save File
km("n", "<C-s>", "<cms>w<cr>", defaultOpts)
km("n", "<leader>s", "<cmd>w<cr>", defaultOpts)

-- Clear Highlights
km("n", "<Esc>", "<cmd>nohlsearch<cr>", defaultOpts)

-- Lazy
km("n", "<leader>l", "<cmd>Lazy<cr>", defaultOpts)

-- Change current working directory to file location
--km("n", "<leader>z", ":cd %:p:h<CR>:pwd<CR>", defaultOpts)

-- Keep Buffer After Paste
km("v", "p", '"_dP', defaultOpts)

-- Quick Switch to Previous Buffer
km("n", "<bs>", "<C-^>", defaultOpts)

-- Make Y yank to end of line
km("v", "Y", "y$", defaultOpts)

-- leave terminal mode
km("t", "<Esc>", "<C-\\><C-N>", defaultOpts)

-- Keep Selection After Indent
vc(":vnoremap < <gv")
vc(":vnoremap > >gv")

-- veritcal and horizontal split
km("n", "<leader>|", ":vsplit<CR><C-w>l", defaultOpts)
km("n", "<leader>-", ":split<CR><C-w>j", defaultOpts)

-- Move Text
km("x", "J", ":move '>+1<CR>gv-gv", defaultOpts)
km("x", "K", ":move '<-2<CR>gv-gv", defaultOpts)
km("x", "<A-j>", ":move '>+1<CR>gv-gv", defaultOpts)
km("x", "<A-k>", ":move '<-2<CR>gv-gv", defaultOpts)

-- Resize split
km("n", "<C-Up>", ":resize -2<CR>", defaultOpts)
km("n", "<C-Down>", ":resize +2<CR>", defaultOpts)
km("n", "<C-Left>", ":vertical resize -2<CR>", defaultOpts)
km("n", "<C-Right>", ":vertical resize +2<CR>", defaultOpts)

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

-- NEOVIDE TODO: move to neovide plugin
-- Toggle Full Screen
km("n", "<F11>", "<cmd>NeovideToggleFullscreen<cr>", defaultOpts)
vim.cmd([[command -nargs=0 NeovideToggleFullscreen :let g:neovide_fullscreen = !g:neovide_fullscreen]])

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

-- Surround shortcut
--km("v", "<leader>a", "S", defaultOptsj

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

-- rebind the command mode
-- km("n", ";", ":", { noremap = true, silent = false })
-- km("n", ":", ";", { noremap = true, silent = false })

-- TODO: Close Buffer, w/ save ?
-- TODO: Readd
-- km("n", "<leader>d", "<cmd>Bdelete<cr>", defaultOpts)
