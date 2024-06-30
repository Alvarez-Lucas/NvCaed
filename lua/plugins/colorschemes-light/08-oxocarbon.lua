-- 983
-- https://github.com/nyoom-engineering/oxocarbon.nvim
return {
	"nyoom-engineering/oxocarbon.nvim",
	enabled = false,
	config = function()
		vim.opt.background = "light" -- set this to dark or light
		vim.cmd.colorscheme("oxocarbon")
	end,
	lazy = false,
	priority = 1000,
}
