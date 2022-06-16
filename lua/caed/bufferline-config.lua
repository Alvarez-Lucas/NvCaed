require("bufferline").setup({
	options = {
		diagnostics = "coc",
		separator_style = "slant",
		diagnostics_update_in_insert = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = function()
					return vim.fn.getcwd()
				end,
				highlight = "Directory",
				text_align = "left",
			},
		},
		show_close_icon = false,
		always_show_bufferline = false,
	},
})
