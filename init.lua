-- vim.opt.shadafile = "NONE"
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
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
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

require("caed.packer")
require("caed.config.keymaps")
require("caed.config.options")
require("caed.config.neovide")

-- vim.opt.shadafile = ""
