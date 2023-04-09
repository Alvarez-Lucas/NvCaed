return {
	"ms-jpq/chadtree",
	branch = "chad",
	build = "python3 -m chadtree deps",
	init = function()
		vim.g.chadtree_settings = {
			["keymap.primary"] = { "l", "<enter>" },
			["options.close_on_open"] = true,
		}
	end,
}
