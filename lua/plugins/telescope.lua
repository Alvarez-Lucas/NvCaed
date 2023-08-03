return {
	{

		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		cmd = "Telescope",
		keys = {
			-- Telescope
			{ "<leader>f", "<cmd>Telescope find_files theme=get_ivy<cr>", desc = "" },
			-- { "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "" },
			-- { "<leader>t", "<cmd>Telescope buffers<cr>", desc = "" },
			{ "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "" },
			-- { "<C-p>", "<cmd>Telescope commands theme=dropdown<cr>", desc = "" },
			{ "<leader>F", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "" },
			{ "<leader>t", "<cmd>Telescope zoxide list theme=get_ivy<cr>", desc = "" },
		},
		config = function()
			local actions = require("telescope.actions")

			-- vim.cmd([[highlight TelescopeMatching       guifg=#719e07]])
			-- vim.cmd([[highlight TelescopeMatching       guifg=#b58900]])
			-- vim.cmd([[highlight TelescopeResultsNormal       guifg=#2aa198]])

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
				-- pickers = {
				-- 	get_ivy = {
				-- 		prompt_title = false,
				-- 	},
				-- 	-- 	find_files = {
				-- 	-- 		-- previewer = false,
				-- 	-- 		-- borderchars = {
				-- 	-- 		-- 	{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				-- 	-- 		-- 	prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
				-- 	-- 		-- 	results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
				-- 	-- 		-- 	preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				-- 	-- 		-- },
				-- 	-- 		width = 0.8,
				-- 	-- 		previewer = false,
				-- 	-- 		prompt_title = false,
				-- 	-- 	},
				-- },
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
			require("telescope").load_extension("zoxide")
			-- require("telescope").load_extension("harpoon")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"natecraddock/telescope-zf-native.nvim",
			"jvgrootveld/telescope-zoxide",
			"nvim-lua/popup.nvim",
		},

		-- {
		-- 	"nvim-telescope/telescope-z.nvim",
		-- 	-- keys = {
		-- 	-- 	{ "<leader>t", "<cmd>lua require'telescope'.extensions.z.list{}<CR>", desc = "" },
		-- 	-- },
		-- 	dependencies = {
		-- 		{ "nvim-lua/plenary.nvim" },
		-- 		{ "nvim-lua/popup.nvim" },
		-- 		{ "nvim-telescope/telescope.nvim" },
		-- 	},
		-- },
	},
}
