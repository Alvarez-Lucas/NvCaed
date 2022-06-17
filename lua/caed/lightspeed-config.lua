-- vim.cmd("let g:lightspeed_no_default_keymaps = 1")

require("lightspeed").setup({
	ignore_case = true,
})

vim.api.nvim_set_keymap("n", "<leader>j", "<Plug>Lightspeed_omni_s", { noremap = false })
