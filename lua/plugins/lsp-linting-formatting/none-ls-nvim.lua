return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				-- null_ls.builtins.code_actions.biome,
				null_ls.builtins.formatting.biome.with({
					filetypes = {
						"javascript",
						"javascriptreact",
						"json",
						"jsonc",
						"typescript",
						"typescriptreact",
					},
					args = {
						"check",
						"--apply",
						-- "--apply-unsafe",
						"--formatter-enabled=true",
						"--organize-imports-enabled=true",
						"--skip-errors",
						"$FILENAME",
					},
				}),
				null_ls.builtins.formatting.prettier.with({
					extra_filetypes = { "vimwiki", "html" },
					disabled_filetypes = { "typescript", "javascript" },
				}),
				-- null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.code_actions.gitsigns,
				-- null_ls.builtins.completion.spell,
			},
		})
	end,
}
