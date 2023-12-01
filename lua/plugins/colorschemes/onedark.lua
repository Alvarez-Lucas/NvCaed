return {
	{
		enabled = true,
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		"navarasu/onedark.nvim",
		config = function()
			-- Remove vimwiki underlines
			vim.api.nvim_create_autocmd("Colorscheme", {
				group = vim.api.nvim_create_augroup("config_custom_highlights", {}),
				callback = function()
					-- Override colorscheme highlighting before its `load()` call
					vim.api.nvim_set_hl(0, "VimwikiLink", { bg = "none", fg = "#80a0ff" })
				end,
			})

			require("onedark").setup({
				-- Main options --
				style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
				-- transparent = false,
				transparent = not vim.g.neovide,
				-- true, -- Show/hide background
				term_colors = true, -- Change terminal color as per the selected theme style
				ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
				cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

				-- toggle theme style ---
				-- toggle_style_key = "<leader>x", -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
				toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

				-- Change code style ---
				-- Options are italic, bold, underline, none
				-- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
				code_style = {
					comments = "none",
					keywords = "none",
					functions = "none",
					strings = "none",
					variables = "none",
				},

				-- Lualine options --
				lualine = {
					transparent = false, -- lualine center bar transparency
				},

				-- Custom Highlights --
				colors = {}, -- Override default colors
				highlights = {
					["VimwikiLink"] = { fmt = "none" },
				}, -- Override highlight groups

				-- Plugins Config --
				diagnostics = {
					darker = false, -- darker colors for diagnostic
					undercurl = true, -- use undercurl instead of underline for diagnostics
					background = false, -- use background color for virtual text
				},
			})
			require("onedark").load()
		end,
	},
}
