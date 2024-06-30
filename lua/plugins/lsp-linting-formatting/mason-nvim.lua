return {

	-- Mason
	{
		lazy = true,
		-- event = "LazyFile",
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},

	-- Mason Null-ls
	{
		"jay-babu/mason-null-ls.nvim",
		lazy = true,
		dependencies = {
			"williamboman/mason.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"black",
					"prettier",
					-- "rustfmt",
				},
			})
		end,
	},

	-- Mason Lspconfig
	{
		lazy = true,
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"yamlls",
					"html",
					"tsserver",
					"taplo",
					"rust_analyzer",
					"powershell_es",
					"emmet_ls",
					"svelte",
					"gopls",
					-- "eslint",
					"biome", -- This could be a replacement for eslint and prettier,
					-- written in rust, its hella fast
					"omnisharp",
					"marksman",
				},
			})
		end,
	},
}
