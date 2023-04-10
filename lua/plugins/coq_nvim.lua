return {
	{
		enabled = false,
		"ms-jpq/coq_nvim",
		branch = "coq",
		build = ":COQdeps",
		init = function()
			vim.g.coq_settings = {
				["keymap.jump_to_mark"] = "<C-b>",
				["display.icons.mode"] = "none",
				["display.icons.spacing"] = 2,
				["display.preview.border"] = "single",
				["display.ghost_text.enabled"] = false,
				["keymap.bigger_preview"] = "null",
				["keymap.recommended"] = false,
				["keymap.pre_select"] = false,
				auto_start = "shut-up",
			}
			-- vim.g.coq_settings = { auto_start = "shut-up" }
		end,
		lazy = false,
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{
				"ms-jpq/coq.artifacts",
				branch = "artifacts",
			},
		},
	},
}
