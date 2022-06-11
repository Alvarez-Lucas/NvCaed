-- api shorteners
local defaultOpts = {noremap = true, silent = true}
local km = vim.api.nvim_set_keymap
local vc = vim.cmd

-- Leader Key
km("", "<Space>", "Nop", defaultOpts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal Mode Keymaps --
km("n", "<C-Up>", ":resize -2<CR>", defaultOpts)
km("n", "<C-Down>", ":resize +2<CR>", defaultOpts)
km("n", "<C-Left>", ":vertical resize -2<CR>", defaultOpts)
km("n", "<C-Right>", ":vertical resize +2<CR>", defaultOpts)

-- Keep Buffer After Paste
km("v", "p", '"_dP', defaultOpts)

-- Shorten Window Navigation
km("n", "<C-h>", "<C-w>h", defaultOpts)
km("n", "<C-j>", "<C-w>j", defaultOpts)
km("n", "<C-k>", "<C-w>k", defaultOpts)
km("n", "<C-l>", "<C-w>l", defaultOpts)

-- Save file
km("n", "<C-s>", "<cmd>w!<cr>", defaultOpts)

-- Move Text
km("x", "J", ":move '>+1<CR>gv-gv", defaultOpts)
km("x", "K", ":move '<-2<CR>gv-gv", defaultOpts)
km("x", "<A-j>", ":move '>+1<CR>gv-gv", defaultOpts)
km("x", "<A-k>", ":move '<-2<CR>gv-gv", defaultOpts)

-- Keep Selection After Indent
vc(":vnoremap < <gv")
vc(":vnoremap > >gv")
