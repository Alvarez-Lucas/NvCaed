return {
	enabled = false,
	lazy = false,
	priority = 1000,
	"calind/selenized.nvim",
	config = function()
		vim.opt.background = "light"
		vim.cmd.colorscheme("selenized")
	end,
}
