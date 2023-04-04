local actions = require("telescope.actions")
local z_utils = require("telescope._extensions.zoxide.utils")

require("telescope").setup({
	defaults = {
		borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
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
	extensions = {
		zoxide = {
			prompt_title = "Directory Jumper",

			-- Zoxide list command with score
			list_command = "zoxide query -ls",
			mappings = {
				default = {
					action = z_utils.create_basic_command("edit"),
				},
				["<C-s>"] = { action = z_utils.create_basic_command("split") },
				["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
				["<C-e>"] = { action = z_utils.create_basic_command("edit") },
			},
		},
	},
})

require("telescope").load_extension("zf-native")
require("telescope").load_extension("zoxide")
