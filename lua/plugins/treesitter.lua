return {

	{
		lazy = true,
		event = { "BufReadPre", "BufNewFile", "InsertEnter", "VeryLazy" },
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"RRethy/nvim-treesitter-textsubjects",
		}, -- TODO: Make sure this still works
		build = "TSUpdate",
		config = function()
			require("nvim-treesitter.install").compilers = { "gcc" } -- { "clang" }
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				highlight = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							-- You can optionally set descriptions to the mappings (used in the desc parameter of
							-- nvim_buf_set_keymap) which plugins like which-key display
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							-- You can also use captures from other query groups like `locals.scm`
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
						-- You can choose the select mode (default is charwise 'v')
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * method: eg 'v' or 'o'
						-- and should return the mode ('v', 'V', or '<c-v>') or a table
						-- mapping query_strings to modes.
						selection_modes = {
							["@parameter.outer"] = "v", -- charwise
							["@function.outer"] = "V", -- linewise
							["@class.outer"] = "<c-v>", -- blockwise
						},
						-- If you set this to `true` (default is `false`) then any textobject is
						-- extended to include preceding or succeeding whitespace. Succeeding
						-- whitespace has priority in order to act similarly to eg the built-in
						-- `ap`.
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * selection_mode: eg 'v'
						-- and should return true or false
						include_surrounding_whitespace = true,
					},
				},
			})
		end,
	},

	{
		lazy = true,
		"numToStr/Comment.nvim",
		event = { "VeryLazy", "BufReadPost", "BufNewFile" },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
		dependencies = {
			{
				init = function()
					vim.g.skip_ts_context_commentstring_module = true
				end,
				"JoosepAlviste/nvim-ts-context-commentstring", -- NOTE: I don't think you need to load treesitter first, or vice versa, could be wrong
				config = function()
					require("ts_context_commentstring").setup({
						enable_autocmd = false,
					})
				end,
			},
		},
	},

	-- {
	-- TODO: nvim-treesitter-textsubjects
	-- [X] Installed
	-- [ ] Configured
	-- https://youtu.be/H-xpqJy_u90?t=109
	-- 1. Enable
	-- 2. Setup keymaps
	-- 3. Setup lazy loading
	-- https://youtu.be/CEMPq_r8UYQ
	-- https://youtu.be/FuYQ7M73bC0
	-- 	enabled = false,
	-- 	config = function()
	-- 		require("nvim-treesitter.configs").setup({
	-- 			textsubjects = {
	-- 				enable = true,
	-- 				prev_selection = ",", -- (Optional) keymap to select the previous selection
	-- 				keymaps = {
	-- 					["."] = "textsubjects-smart",
	-- 					[";"] = "textsubjects-container-outer",
	-- 					["i;"] = "textsubjects-container-inner",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
}
