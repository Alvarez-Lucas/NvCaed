-- https://github.com/ellisonleao/gruvbox.nvim
return {
	"ellisonleao/gruvbox.nvim",
	enabled = true,
	config = function()
		vim.opt.background = "light" -- set this to dark or light
		-- Default options:
		require("gruvbox").setup({
			terminal_colors = true, -- add neovim terminal colors
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = false,
				emphasis = false,
				comments = false,
				operators = false,
				folds = false,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			palette_overrides = {},
			overrides = {
				SignColumn = { bg = "None" }, -- make sign column
				Sign = { bg = "None" }, -- make sign column
				GruvboxRedSign = { bg = "None" },
				GruvboxGreenSign = { bg = "None" },
				GruvboxYellowSign = { bg = "None" },
				GruvboxBlueSign = { bg = "None" },
				GruvboxPurpleSign = { bg = "None" },
				GruvboxAquaSign = { bg = "None" },
				GruvboxOrangeSign = { bg = "None" },

				-- LineNr = { bg = "None" }, -- make sign column
				CursorLineNr = { bg = "None" },
			},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.cmd.colorscheme("gruvbox")
	end,
	lazy = false,
	priority = 1000,
}
