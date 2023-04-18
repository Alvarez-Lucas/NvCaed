return {
	{
		enabled = true,
		"nvim-treesitter/nvim-treesitter",
		build = "TSUpdate",
		config = function()
			require("nvim-treesitter.install").compilers = { "clang" }
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				rainbow = {
					enable = true,
					-- list of languages you want to disable the plugin for
					disable = { "jsx", "cpp" },
					-- Which query to use for finding delimiters
					query = "rainbow-parens",
					-- Highlight the entire buffer all at once
					strategy = require("ts-rainbow").strategy.global,
				},
			})
		end,
		dependencies = { "HiPhish/nvim-ts-rainbow2" },
	},
}
