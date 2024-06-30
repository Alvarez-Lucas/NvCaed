-- 2k
-- https://github.com/rose-pine/neovim
-- Interesting, low contrast but pretty
return {
	"rose-pine/neovim",
	name = "rose-pine",
	enabled = false,
	config = function()
		require("rose-pine").setup({
			variant = "dawn", -- auto, main, moon, or dawn
			dark_variant = "main", -- main, moon, or dawn
			dim_inactive_windows = false,
			extend_background_behind_borders = true,

			enable = {
				terminal = true,
				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
				migrations = true, -- Handle deprecated options automatically
			},

			styles = {
				bold = true,
				italic = false,
				transparency = false,
			},
		})

		vim.cmd.colorscheme("rose-pine-dawn")
	end,
	lazy = false,
	priority = 1000,
}
