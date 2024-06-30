return {
	lazy = true,
	"neovim/nvim-lspconfig",
	-- event = { "BufReadPre", "BufNewFile" },
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	-- event = { "LazyFile" },
	dependencies = {
		-- "nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
		"folke/neodev.nvim",
	},
	config = function()
		-- Setup language servers.
		local lspconfig = require("lspconfig")

		-- Set up lspconfig.
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- LSP Signs in sign column 󰌶
		-- local signs = { Error = "󰝤 ", Warn = " ", Hint = " ", Info = " " }
		-- local signs = { Error = "󰅚 ", Warn = " ", Hint = "󰛩 ", Info = " " }
		-- local signs = { Error = "■ ", Warn = " ", Hint = " ", Info = " " }
		-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

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
			virtual_text = {
				severity = vim.diagnostic.severity.ERROR,
				prefix = "●", -- Could be '●', '▎', 'x'
			},
		})

		--------------------------------	Servers --------------------------------
		-- Golang
		lspconfig.gopls.setup({ capabilities = capabilities })
		-- Python
		lspconfig.svelte.setup({ capabilities = capabilities })
		-- Python
		lspconfig.pyright.setup({ capabilities = capabilities })
		-- Yaml
		lspconfig.yamlls.setup({ capabilities = capabilities })
		lspconfig.marksman.setup({ capabilities = capabilities })
		-- Powershell
		lspconfig.powershell_es.setup({
			capabilities = capabilities,
			bundle_path = "C:\\Users\\Luckus\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services",
			-- cmd = { "pwsh", "-NoLogo", "-NoProfile", "-Command", "Start-EditorServices.ps1" },
			-- bundle_path = "C:\\bin\\PowerShellEditorServices\\PowerShellEditorServices",
			--bundle_path = "C:\\bin\\PowerShellEditorServices",
			-- TODO: Figure this out Programatically
		})
		-- Taplo (toml): Mason does not auto install
		lspconfig.taplo.setup({ capabilities = capabilities })

		lspconfig.omnisharp.setup({
			capabilities = capabilities,
			cmd = {
				"dotnet",
				"C:\\Users\\LuckusAppData\\Local\\nvim-data\\mason\\packages\\omnisharp\\libexec\\OmniSharp.dll",
			},
			root_dir = lspconfig.util.root_pattern("*.sln", "*.vbproj", "omnisharp.json", "function.json"),
			--     function ()
			--   return  "*.sln", "*.vbproj", "omnisharp.json", "function.json"
			-- end,
			settings = {
				FormattingOptions = {
					-- Enables support for reading code style, naming convention and analyzer
					-- settings from .editorconfig.
					EnableEditorConfigSupport = true,
					-- Specifies whether 'using' directives should be grouped and sorted during
					-- document formatting.
					OrganizeImports = true,
				},
				MsBuild = {
					-- If true, MSBuild project system will only load projects for files that
					-- were opened in the editor. This setting is useful for big C# codebases
					-- and allows for faster initialization of code navigation features only
					-- for projects that are relevant to code that is being edited. With this
					-- setting enabled OmniSharp may load fewer projects and may thus display
					-- incomplete reference lists for symbols.
					LoadProjectsOnDemand = nil,
				},
				RoslynExtensionsOptions = {
					-- Enables support for roslyn analyzers, code fixes and rulesets.
					EnableAnalyzersSupport = nil,
					-- Enables support for showing unimported types and unimported extension
					-- methods in completion lists. When committed, the appropriate using
					-- directive will be added at the top of the current file. This option can
					-- have a negative impact on initial completion responsiveness,
					-- particularly for the first few completion sessions after opening a
					-- solution.
					EnableImportCompletion = true,
					-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
					-- true
					AnalyzeOpenDocumentsOnly = nil,
				},
			},
		})

		-- Typescript - vscode-langservers-extracted
		-- lspconfig.eslint.setup({})
		lspconfig.biome.setup({ capabilities = capabilities, single_file_support = true })
		lspconfig.tsserver.setup({ capabilities = capabilities })
		-- eslint
		-- Biome - Prettier and eslint replacement

		-- root_dir = function(fname)
		-- 	return util.root_pattern("biome.json", "biome.jsonc")(fname)
		-- 		or util.find_package_json_ancestor(fname)
		-- 		or util.find_node_modules_ancestor(fname)
		-- 		or util.find_git_ancestor(fname)
		-- end,
		-- HTML
		lspconfig.html.setup({ capabilities = capabilities, filetypes = { "html", "css" } })
		-- Rust
		lspconfig.rust_analyzer.setup({ capabilities = capabilities, settings = { ["rust-analyzer"] = {} } })
		-- Lua
		lspconfig.lua_ls.setup({ capabilities = capabilities })
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
		})

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		-- vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
		vim.keymap.set("n", "<space>k", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				-- TODO find a new keybind for this is you still want it
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
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
}
