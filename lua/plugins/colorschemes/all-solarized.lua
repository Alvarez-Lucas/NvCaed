return {
	{
		enabled = false,
		"maxmx03/solarized.nvim",
		config = function()
			vim.o.background = "dark" -- or 'light'

			vim.cmd.colorscheme("solarized")
		end,
	},
	{
		enabled = true,
		"svrana/neosolarized.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("neosolarized").setup({
				comment_italics = false,
				background_set = false,
			})
		end,
		dependencies = { "tjdevries/colorbuddy.nvim" },
	},
	{
		enabled = false,
		"Tsuzat/NeoSolarized.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("NeoSolarized").setup({
				style = "dark", -- "dark" or "light"
				transparent = false, -- true/false; Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
				styles = {
					-- Style to be applied to different syntax groups
					comments = { italic = true },
					keywords = { italic = true },
					functions = { bold = true },
					variables = {},
					string = { italic = true },
					underline = true, -- true/false; for global underline
					undercurl = true, -- true/false; for global undercurl
				},
			})
			vim.cmd([[ colorscheme NeoSolarized ]])
		end,
	},
	{
		enabled = false,
		"ishan9299/nvim-solarized-lua",
	},
	{
		enabled = false,
		-- "ianchanning/vim-selenized",
		"jan-warchol/selenized",
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/editors/vim")
			-- vim.cmd([[colorscheme selenized]])
		end,
	},
}
