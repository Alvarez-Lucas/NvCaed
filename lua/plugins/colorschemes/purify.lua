return {
	{
		enabled = false,
		"kyoz/purify",
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/vim")
			vim.cmd("colorscheme purify")
		end,
	},
}
