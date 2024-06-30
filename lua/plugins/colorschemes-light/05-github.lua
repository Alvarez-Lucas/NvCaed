-- 2k
-- https://github.com/projekt0n/github-nvim-theme

return {
	"projekt0n/github-nvim-theme",
	enabled = false,
	config = function()
		vim.cmd.colorscheme("github_light")
		-- vim.cmd.colorscheme("github_light_default")
		-- vim.cmd.colorscheme("github_light_high_contrast")
	end,
	lazy = false,
	priority = 1000,
}
