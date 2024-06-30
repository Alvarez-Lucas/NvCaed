return {

	{
		"NeogitOrg/neogit",
		keys = {
			{ "<leader>v", "<cmd>Neogit<cr>", desc = "" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			-- "sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			-- "ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
}
