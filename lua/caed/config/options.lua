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
vim.g.lightspeed_no_default_keymaps = 0
