return {
	{
		"tamton-aquib/staline.nvim",
		-- priority = ,
		config = function()
			require("staline").setup({
				sections = {
					left = { "  ", "mode", " ", "file_name", " ", "lsp" },
					mid = {},
					-- mid = { "stalinegit" },
					-- mid = { "file_name" },
					-- right = { "file_name", "line_column" },
					right = { "branch", " ", "line_column" },
				},
				mode_colors = {
					i = "#008700",
					n = "#27408B",
					c = "#005F87",
					v = "#AF5F00",
				},

				mode_icons = {
					n = " ",
					i = "󰏪 ",
					c = " ",
					v = " ", -- etc..
					V = " ", -- etc..
				},

				defaults = {
					true_colors = true,
					line_column = " [%l/%L] :%c  ",
					branch_symbol = "󰊢 ",
					mod_symbol = "  ",
				},
				lsp_symbols = {
					-- Error = "󰅚 ",
					-- Info = "󰋼 ",
					-- Error = "■ ",
					-- Error = "󰝤 ",

					Error = "󰅚 ",
					-- Error = " ",
					Info = " ",
					Warn = " ",
					Hint = " ",
				},
			})
		end,
	},
}
