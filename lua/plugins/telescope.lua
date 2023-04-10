return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				-- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
				-- Default configuration for telescope goes here:
				-- config_key = value,
				mappings = {
					i = {
						["<esc>"] = actions.close,
						["<C-u>"] = false,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
				},
			},
			extensions = {
				["zf-native"] = {
					-- options for sorting file-like items
					file = {
						-- override default telescope file sorter
						enable = true,

						-- highlight matching text in results
						highlight_results = true,

						-- enable zf filename match priority
						match_filename = true,
					},

					-- options for sorting all other items
					generic = {
						-- override default telescope generic item sorter
						enable = true,

						-- highlight matching text in results
						highlight_results = true,

						-- disable zf filename match priority
						match_filename = false,
					},
				},
			},
		})

		require("telescope").load_extension("zf-native")
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"natecraddock/telescope-zf-native.nvim",
	},
}
