require("bufferline").setup({
	options = {
		diagnostics = "coc",
		-- numbers = "ordinal",
		numbers = function(opts)
			return string.format("%s", opts.raise(opts.ordinal))
		end,

		color_icons = true,
		separator_style = "thin",
		diagnostics_update_in_insert = true,
		show_close_icon = false,
		show_buffer_close_icons = false,
		always_show_bufferline = false,
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
	},
})
