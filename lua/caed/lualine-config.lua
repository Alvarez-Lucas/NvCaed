-- an idea of how to customize an existing theme with a transparent background
-- maybe figure out how to make the entire thing transparent?
-- local custom = require("lualine.themes.nord")
-- custom.normal.c.bg = "#FFFFFF00"
-- local function stuff()
-- 	-- return require("lspsaga.symbolwinbar").get_winbar()
-- 	return "hellow"
-- end
require("lualine").setup({

	options = {
		icons_enabled = true,
		-- theme = "auto",
		-- theme = "monokai-pro",
		theme = "edge",
		-- theme = custom,
		-- component_separators = "▊",
		component_separators = "|",
		section_separators = "",
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		-- lualine_c = { "require('lspsaga.symbolwinbar'):get_winbar()" },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
