return {
	{
		enabled = false,
		"maxmx03/solarized.nvim",
		config = function()
			vim.o.background = "dark" -- or 'light'

			vim.cmd.colorscheme("solarized")
		end,
	},
	-- THE BEST ONE IS THE FOLLOWING
	{
		enabled = false,
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
		lazy = false,
		priority = 1000,
		-- "ianchanning/vim-selenized",
		-- "jan-warchol/selenized",
		"Alvarez-Lucas/selenized-bw.nvim",
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/editors/vim")
			-- vim.opt.background = "light"
			vim.cmd.colorscheme("selenized")
			-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "GitGutterAdd", { fg = "green", bg = "bg" })
			vim.api.nvim_set_hl(0, "GitGutterChange", { bg = "bg" })
			-- vim.api.nvim_set_hl(0, "LineNr", { bg = "NONE", fg= })

			-- vim.api.nvim_set_hl(0, "GitsignsCurrentLineBlame", { link = "Todo" })

			-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
			-- vim.cmd([[highlight clear SignColumn]])
			-- vim.cmd([[colorscheme selenized]])
			-- vim.api.nvim_set_hl(0, "GitGutterChange", { fg = theme.base0D, bg = theme.base00 })
			-- vim.api.nvim_set_hl(0, "GitGutterDelete", { fg = theme.base08, bg = theme.base00 })
			-- vim.api.nvim_set_hl(0, "GitGutterChangeDelete", { fg = theme.base0E, bg = theme.base00 })

			-- LSP
			-- vim.api.nvim_set_hl(0, "DiagnosticError", { fg = theme.base08, bg = theme.base00 })
			-- vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = theme.base08, bg = theme.base00 })
			-- vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = theme.base0C, bg = theme.base00 })
			-- vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = theme.base05, bg = theme.base00 })
			-- vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = theme.base0A, bg = theme.base00 })
		end,
	},
}
