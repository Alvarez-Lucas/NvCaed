return {
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		config = function()
			require("barbecue").setup({
				context_follow_icon_color = false,
				kinds = {
					-- File = "", -- from barbecue icons
					File = "󰈙", -- from probably vscode like icons
					-- File = " ", -- from probably navic default

					-- Module = "",
					Module = "",
					-- Module = " ",

					-- Namespace = "",
					Namespace = "󰌗 ",
					-- Namespace = " ",

					Package = "",
					-- Package = " ",
					-- Package = " ",

					-- Class = "",
					-- Class = "󰌗",
					Class = "",

					-- Method = "",
					Method = "󰆧",
					-- Method = " ",

					-- Property = "",
					-- Property = " ",
					Property = "",

					-- Field = "",
					-- Field = "",
					-- Field = " ",
					Field = "󰽐",

					-- Constructor = "",
					-- Constructor = "",
					-- Constructor = " ",
					Constructor = "󱁤",

					Enum = "",
					-- Enum = "󰕞",
					-- Enum = " ",

					Interface = "",
					-- Interface = "󰕞",
					-- Interface = " ",

					-- Function = "",
					Function = "󰡱",
					-- Function = " ",

					-- Variable = "",
					-- Variable = "󰆧",
					-- Variable = " ",
					Variable = "",

					-- Constant = "",
					Constant = "󰏿",
					-- Constant = " ",

					-- String = "",
					-- String = " ",
					-- String = "",
					String = "󰀬",

					-- Number = "",
					Number = "󰎠",
					-- Number = " ",

					-- Boolean = "",
					-- Boolean = "◩ ",
					Boolean = "",

					-- Array = "",
					-- Array = "󰅪",
					-- Array = "",
					Array = "󰅨",

					Object = "󱃖",
					-- Object = "",
					-- Object = "󰅩",
					-- Object = " ",

					-- Key = "",
					Key = "󰌋",
					-- Key = " ",

					-- Null = "",
					Null = "󰟢",
					-- Null = " ",

					EnumMember = "",
					-- EnumMember = " ",
					-- EnumMember = " ",

					Struct = "",
					-- Struct = "󰌗 ",
					-- Struct = " ",

					-- Event = "",
					Event = "",
					-- Event = " ",

					-- Operator = "",
					Operator = "󰆕",
					-- Operator = " ",

					-- TypeParameter = "",
					-- TypeParameter = "󰊄",
					-- TypeParameter = " ",
					TypeParameter = "󰬛",
				},
			})
		end,
		opts = {
			-- configurations go here
		},
	},
}
