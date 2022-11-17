local actions = require("telescope.actions")

require("telescope").load_extension("zoxide")
require("telescope").load_extension("zf-native")

require("telescope").setup({
	defaults = {
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
	pickers = {
		find_files = {
			theme = "dropdown",
			previewer = false,
		},
		zoxide = {
			theme = "dropdown",
			previewer = false,
		},
		buffers = {
			theme = "dropdown",
			previewer = false,
		},
		bookmarks = {
			theme = "dropdown",
			previewer = false,
		},
	},
	extensions = {},
})
