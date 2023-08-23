return {
	-- mason
	{
		lazy = false,
		priority = 900,
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})
		end,
	},

	-- mason lspconfig
	{
		lazy = false,
		priority = 800,
		"williamboman/mason-lspconfig.nvim",
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
				},
			})
		end,
	},

	-- lspconfig
	{
		lazy = false,
		priority = 700,
		"neovim/nvim-lspconfig",
		dependencies = {
			"nvim-cmp",
		},
		config = function()
			-- Setup language servers.
			local lspconfig = require("lspconfig")

			-- Set up lspconfig.
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- LSP Signs in sign column 󰌶
			-- local signs = { Error = "󰅚 ", Warn = " ", Hint = "󰛩 ", Info = " " }
			-- local signs = { Error = "■ ", Warn = " ", Hint = " ", Info = " " }
			local signs = { Error = "󰝤 ", Warn = " ", Hint = " ", Info = " " }
			-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- border TODO: remove after installing lspsaga
			-- local border = {
			-- 	{ "🭽", "FloatBorder" },
			-- 	{ "▔", "FloatBorder" },
			-- 	{ "🭾", "FloatBorder" },
			-- 	{ "▕", "FloatBorder" },
			-- 	{ "🭿", "FloatBorder" },
			-- 	{ "▁", "FloatBorder" },
			-- 	{ "🭼", "FloatBorder" },
			-- 	{ "▏", "FloatBorder" },
			-- }
			-- To instead override globally TODO: remove after installing lspsaga
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				-- opts.border = opts.border or border
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			-- moonfly border around floats
			-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			-- 	border = "single",
			-- })
			-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
			-- 	border = "single",
			-- })
			-- vim.diagnostic.config({ float = { border = "single" }, update_in_insert = true })
			vim.diagnostic.config({
				update_in_insert = true,
				virtual_text = { severity = vim.diagnostic.severity.ERROR },
			})

			--------------------------------	Servers --------------------------------
			-- Python
			lspconfig.svelte.setup({ capabilities = capabilities })
			-- Python
			lspconfig.pyright.setup({ capabilities = capabilities })
			-- Yaml
			lspconfig.yamlls.setup({ capabilities = capabilities })
			-- Powershell
			lspconfig.powershell_es.setup({
				capabilities = capabilities,
				-- bundle_path = "C:\\bin\\PowerShellEditorServices\\PowerShellEditorServices",
				bundle_path = "C:\\bin\\PowerShellEditorServices",
			})
			-- Taplo (toml): Mason does not auto install
			lspconfig.taplo.setup({ capabilities = capabilities })
			-- Typescript - vscode-langservers-extracted
			lspconfig.tsserver.setup({ capabilities = capabilities })
			-- HTML
			lspconfig.html.setup({ capabilities = capabilities, filetypes = { "html", "css" } })
			-- Rust
			lspconfig.rust_analyzer.setup({ capabilities = capabilities, settings = { ["rust-analyzer"] = {} } })
			-- Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = { Lua = { diagnostics = { globals = { "vim" } } } },
			})
			-- Emmet_ls
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"css",
					"eruby",
					"html",
					"javascript",
					"javascriptreact",
					"less",
					"sass",
					"scss",
					"svelte",
					"pug",
					"typescriptreact",
					"vue",
				},
				-- init_options = {
				-- 	html = {
				-- 		options = {
				-- 			-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				-- 			-- ["jsx.enabled"] = true,
				-- 		},
				-- 	},
				-- },
			})

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "<space>k", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					-- Buffer local mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					-- TODO find a new keybind for this is you still want it
					-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					-- TODO find a new keybind for vim.lsp.buf.signature_help
					-- the one commented below interferes with coq selecting
					-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
					-- vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<space>n", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					-- TODO make a keybind for this that doesn't interfere with telescope
					-- vim.keymap.set("n", "<space>f", function()
					--vim.lsp.buf.format({ async = true })
					--end, opts)
				end,
			})
		end,
	},

	-- null-ls
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local null_ls = require("null-ls")
			-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.prettier.with({ extra_filetypes = { "vimwiki", "html" } }),
					null_ls.builtins.formatting.rustfmt,
					null_ls.builtins.code_actions.gitsigns,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.code_actions.eslint,
					-- null_ls.builtins.completion.spell,
				},
			})
		end,
	},

	-- null-ls and mason-null-ls
	{
		"jay-babu/mason-null-ls.nvim",
		-- event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = { "stylua", "black", "prettier", "rustfmt", "eslint" },
			})
		end,
	},
	{
		"https://git.sr.ht/~nedia/auto-format.nvim",
		event = "BufWinEnter",
		config = function()
			require("auto-format").setup({
				-- The name of the augroup.
				augroup_name = "AutoFormat",

				-- If formatting takes longer than this amount of time, it will fail. Having no
				-- timeout at all tends to be ugly - larger files, complex or poor formatters
				-- will struggle to format within whatever the default timeout
				-- `vim.lsp.buf.format` uses.
				timeout = 6000,

				-- These filetypes will not be formatted automatically.
				exclude_ft = {},

				-- Prefer formatting via LSP for these filetypes.
				prefer_lsp = {},
			})
		end,
	},
}
