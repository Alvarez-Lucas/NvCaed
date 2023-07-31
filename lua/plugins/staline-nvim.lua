return {
	{
		"tamton-aquib/staline.nvim",
		-- priority = ,
		config = function()
			require("staline").setup({
				sections = {
					left = { "  ", "mode", " ", "branch", " ", "file_name", " " },
					mid = {},
					-- mid = { "stalinegit" },
					-- mid = { "file_name" },
					-- right = { "file_name", "line_column" },
					right = { "lsp", " ", "line_column" },
				},
				mode_colors = {
					i = "#d4be98",
					n = "#84a598",
					c = "#8fbf7f",
					v = "#fc802d",
				},

				mode_icons = {
					n = " ",
					i = "󰏪 ",
					c = " ",
					v = " ", -- etc..
					V = " ", -- etc..
					cv = " ",
				},

				defaults = {
					true_colors = true,
					line_column = " [%l/%L] :%c  ",
					branch_symbol = "󰊢 ",
					mod_symbol = "  ",
				},
				lsp_symbols = {
					Error = "󰅚 ",
					-- Info = "󰋼 ",
					Info = "",
					Warn = " ",
					Hint = "",
				},
			})
		end,
	},
}
