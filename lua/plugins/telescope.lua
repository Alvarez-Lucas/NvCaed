return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		cmd = "Telescope",
		keys = {
			-- Telescope
			{ "<leader>f", "<cmd>Telescope find_files theme=get_ivy<cr>", desc = "" },
			{ "<leader>g", "<cmd>Telescope live_grep theme=get_ivy<cr>", desc = "" },
			{ "<leader>F", "<cmd>Telescope current_buffer_fuzzy_find theme=get_ivy<cr>", desc = "" },
			{ "<leader>d", "<cmd>Telescope lsp_document_symbols theme=get_ivy<cr>", desc = "" },
			{ "<leader>x", "<cmd>TodoTelescope theme=get_ivy<cr>", desc = "" },
		},
		config = function()
			local actions = require("telescope.actions")
			-- vim.cmd([[highlight TelescopeMatching       guifg=#719e07]])
			-- vim.cmd([[highlight TelescopeMatching       guifg=#b58900]])
			-- vim.cmd([[highlight TelescopeResultsNormal       guifg=#2aa198]])
			--
			local z_utils = require("telescope._extensions.zoxide.utils")
			require("telescope").setup({
				defaults = {
					-- borderchars = { "█", " ", "▀", "█", "█", " ", " ", "▀" },
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
					-- get_ivy = {
					-- 	prompt_title = false,
					-- },
					-- 	find_files = {
					-- 		-- previewer = false,
					-- 		-- borderchars = {
					-- 		-- 	{ "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					-- 		-- 	prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
					-- 		-- 	results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
					-- 		-- 	preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					-- 		-- },
					-- 		width = 0.8,
					-- 		previewer = false,
					-- 		prompt_title = false,
					-- 	},
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

					zoxide = {
						prompt_title = "Zoxide List",

						-- Zoxide list command with score
						list_command = "zoxide query -ls",
						mappings = {
							default = {
								action = function(selection)
									vim.cmd.edit(selection.path)
									-- vim.cmd([[<cmd>NvimTreeFocus<cr>]])
								end,
								after_action = function()
									z_utils.create_basic_command("NvimTreeFocus")
								end,
							},
							["<C-s>"] = { action = z_utils.create_basic_command("split") },
							["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
							["<C-e>"] = { action = z_utils.create_basic_command("edit") },
							["<C-b>"] = {
								keepinsert = true,
								action = function(selection)
									builtin.file_browser({ cwd = selection.path })
								end,
							},
							["<C-f>"] = {
								keepinsert = true,
								action = function(selection)
									builtin.find_files({ cwd = selection.path })
								end,
							},
							["<C-t>"] = {
								action = function(selection)
									vim.cmd.tcd(selection.path)
								end,
							},
						},
					},
				},
			})

			require("telescope").load_extension("zf-native")
			-- require("telescope").load_extension("harpoon")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"natecraddock/telescope-zf-native.nvim",
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
	{
		"jvgrootveld/telescope-zoxide",
		keys = {
			{ "<leader>t", "<cmd>Telescope zoxide list theme=get_ivy<cr>", desc = "" },
		},
		cmd = {

			"Telescope zoxide list",
		},
		config = function()
			require("telescope").load_extension("zoxide")
		end,
	},
}
