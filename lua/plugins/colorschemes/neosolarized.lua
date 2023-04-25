return {
	{
		enabled = false,
		"svrana/neosolarized.nvim",
		config = function()
			require("neosolarized").setup({
				comment_italics = false,
				background_set = true,
			})
		end,
		dependencies = { "tjdevries/colorbuddy.nvim" },
	},
}
