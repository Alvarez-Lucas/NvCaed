return {
	{
		"ms-jpq/coq_nvim",
		branch = "coq",
		build = ":COQdeps",
		init = function()
			vim.g.coq_settings = {
				["display.icons.mode"] = "short",
				["display.icons.spacing"] = 2,
				["display.preview.border"] = "single",
				["display.ghost_text.enabled"] = false,
				["keymap.bigger_preview"] = "null",
				["keymap.recommended"] = false,
				["keymap.pre_select"] = false,
				auto_start = "shut-up",
			}
			vim.cmd([[
" Keybindings
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <C-j>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <C-k> pumvisible() ? "\<C-p>" : "\<BS>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"
      ]])
			-- vim.g.coq_settings = { auto_start = "shut-up" }
		end,
		lazy = false,
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{
				"ms-jpq/coq.artifacts",
				branch = "artifacts",
			},
		},
	},
}
