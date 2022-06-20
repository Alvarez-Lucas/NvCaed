vim.opt.shadafile = "NONE"
-- _G.__luacache_config = {
-- 	chunks = {
-- 		enable = true,
-- 		path = vim.fn.stdpath("cache") .. "/luacache_chunks",
-- 	},
-- 	modpaths = {
-- 		enable = true,
-- 		path = vim.fn.stdpath("cache") .. "/luacache_modpaths",
-- 	},
-- }

-- Disable some builtin vim plugins

local disabled_built_ins = {
	-- "netrw",
	-- "netrwPlugin",
	-- "netrwSettings",
	-- "netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

require("impatient")

-- Lightspeed disabled default maps
vim.g.lightspeed_no_default_keymaps = 0
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- vim.g.coc_status_warning_sign = ""
-- vim.g.coc_status_error_sign = ""
-- { name = "DiagnosticSignError", text = "" },
-- { name = "DiagnosticSignWarn", text = "" },
-- { name = "DiagnosticSignHint", text = "" },
-- { name = "DiagnosticSignInfo", text = "" },

-- VimWiki global before initializing
vim.cmd("let g:vimwiki_global_ext = 0")
vim.cmd("let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}")
vim.cmd(
	"let g:vimwiki_list = [{'path': '~/vimwiki', 'template_path': '~/vimwiki/templates/', 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md', 'path_html': '~/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown', 'template_ext': '.tpl'}]"
)

require("caed.packer-config")
require("caed.config.keymaps")
require("caed.config.options")
require("caed.config.neovide")

vim.opt.shadafile = ""
