require("lualine").setup({
	options = {
		icons_enabled = true,
		-- theme = "auto",
		theme = "moonfly",
		-- theme = "onedark",
		-- theme = "gruvbox-baby",
		-- component_separators = { left = "", right = "" },
		-- section_separators = { left = "", right = "" },
		component_separators = { "" },
		section_separators = { "" },
		disabled_filetypes = { "alpha", "NvimTree", "packer", "TelescopePrompt" },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			"mode",
		},

		lualine_b = { "branch" },
		-- lualine_c = {
		-- 	"filename",
		-- 	"%=",
		-- 	"diff",
		-- 	"%\\|",
		-- 	"diagnostics",
		-- 	"%\\",
		-- },
		lualine_c = {
			"filename",
			"%=",
			"diagnostics",
			"%",
		},

		-- lualine_c = {
		-- 	"filename",
		-- 	"%=",
		-- 	"diagnostics",
		-- 	"%\\",
		-- },
		lualine_x = {},
		lualine_y = { "diff", "filetype" },
		lualine_z = { "%3.4l / %-3.4L" },
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
	extensions = {},
})
