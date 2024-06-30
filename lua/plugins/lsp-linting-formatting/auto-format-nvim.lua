return {
	{
		lazy = true,
		"https://git.sr.ht/~nedia/auto-format.nvim",
		event = { "BufWritePre" },
		config = function()
			require("auto-format").setup({
				augroup_name = "AutoFormat",
				timeout = 6000,
				exclude_ft = {},
				prefer_lsp = { "rust" },
			})
		end,
	},
}
