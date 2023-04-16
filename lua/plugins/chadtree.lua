return {
	enabled = false,
	"ms-jpq/chadtree",
	branch = "chad",
	build = "python3 -m chadtree deps",
	init = function()
		-- vim.cmd([[
		-- augroup Chad
		-- autocmd!
		-- autocmd StdinReadPre * let s:std_in=1
		-- autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CHADopen' | wincmd p | ene | exe 'cd '.argv()[0] | endif
		-- augroup END
		-- ]])
		vim.g.chadtree_settings = {
			["keymap.primary"] = { "l", "<enter>" },
			["options.close_on_open"] = true,
		}
	end,
}
