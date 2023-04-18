return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.1",
	keys = {
		-- Telescope
		{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "" },
		{ "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "" },
		{ "<leader>t", "<cmd>Telescope buffers<cr>", desc = "" },
		{ "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "" },
		{ "<C-p>", "<cmd>Telescope commands theme=dropdown<cr>", desc = "" },
		{ "<leader>F", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "" },
	},
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
