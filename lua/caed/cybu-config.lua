local ok, cybu = pcall(require, "cybu")
if not ok then
	return
end
cybu.setup({
	position = {
		relative_to = "editor",
		anchor = "center",
		max_win_height = 30,
	},

	style = {
		path = "tail", -- absolute, relative, tail (filename only)
		padding = 5,
		border = "rounded",
	},
	behavior = { -- set behavior for different modes
		mode = {
			default = {
				switch = "immediate", -- immediate, on_close
				view = "paging", -- paging, rolling
			},
			last_used = {
				switch = "on_close", -- immediate, on_close
				view = "paging", -- paging, rolling
			},
		},
	},
})
-- vim.keymap.set("n", "K", "<Plug>(CybuPrev)")
vim.keymap.set("n", "H", "<Plug>(CybuPrev)")
-- vim.keymap.set("n", "J", "<Plug>(CybuNext)")
vim.keymap.set("n", "L", "<Plug>(CybuNext)")
