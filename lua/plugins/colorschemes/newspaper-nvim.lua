return {
	{
		"yorik1984/newpaper.nvim",
		enabled = false,
		priority = 1000,
		lazy = false,
		config = function()
			-- Default settings
			--
			vim.o.guicursor = "n:block-nCursor,v:block-vCursor,i:ver25-iCursor,r:hor25-rCursor,c:ver25-cCursor"
			require("newpaper").setup({
				style = "light",
				lightness = 0,
				saturation = 0,
				greyscale = false,
				editor_better_view = false, -- Default: true
				terminal = "contrast",
				contrast_float = true,
				contrast_telescope = false, -- Default: true
				operators_bold = true,
				delimiters_bold = false,
				brackets_bold = false,
				delim_rainbow_bold = false,
				booleans = "bold",
				keywords = "bold",
				regex = "bold",
				regex_bg = true,
				tags = "bold",
				tags_brackets_bold = true,
				tex_major = "bold",
				tex_operators_bold = true,
				tex_brackets_bold = false,
				tex_math_delim_bold = false,
				tex_keywords = "NONE",
				tex_zone = "italic",
				tex_arg = "italic",
				error_highlight = "both", -- Default: undercurl
				italic_strings = false, -- Default: true
				italic_comments = false, -- Default: true
				italic_doc_comments = false, -- Default: true
				italic_functions = false,
				italic_variables = false,
				borders = false, -- Default: true
				disable_background = false,
				lsp_virtual_text_bg = false, -- Default: true
				hide_eob = false,
				colors = {},
				colors_advanced = {},
				custom_highlights = {},
				lualine_bold = true,
				lualine_style = "light",
				devicons_custom = {},
			})
		end,
	},
}
