local ok, cybu = pcall(require, "cybu")
if not ok then
	return
end
cybu.setup({
	position = {
		relative_to = "editor",
		anchor = "center",
	},

	style = {
		path = "tail", -- absolute, relative, tail (filename only)
		padding = 5,
	},
})
-- vim.keymap.set("n", "K", "<Plug>(CybuPrev)")
vim.keymap.set("n", "H", "<Plug>(CybuPrev)")
-- vim.keymap.set("n", "J", "<Plug>(CybuNext)")
vim.keymap.set("n", "L", "<Plug>(CybuNext)")
