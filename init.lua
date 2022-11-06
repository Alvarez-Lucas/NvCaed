-- TODO: Figure out what this does before adding it back
-- vim.opt.shadafile = "NONE"

-- TODO: Figure out what this does before adding it back
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

-- TODO: Add this back after minimal config when ready for speed optimization
-- require("impatient")

-- vim.cmd("let g.coq_settings = { 'auto_start' : v:true }")

require("caed.config.options")
require("caed.config.keymaps")
require("caed.packer-config")
-- require("caed.config.neovide")

vim.opt.shadafile = ""
