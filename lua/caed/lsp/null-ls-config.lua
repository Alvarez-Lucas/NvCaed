local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.prettier.with({ extra_filetypes = { "vimwiki" } }),
		formatting.stylua,
		formatting.black,
		formatting.taplo,
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		-- print("filetype fingers crossed x3")
		-- print(vim.bo.filetype)
		-- vimwiki format on save
		-- if vim.bo.filetype == "vimwiki" then
		-- 	print("we made it to vimwiki")
		-- 	vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		-- 	vim.api.nvim_create_autocmd("BufWritePre", {
		-- 		group = augroup,
		-- 		buffer = bufnr,
		-- 		callback = function()
		-- 			vim.lsp.buf.format({
		-- 				filter = function(client)
		-- 					--  only use null-ls for formatting instead of lsp server
		-- 					-- if vim.bo.filetype == "powershell" then
		-- 					-- 	print("we in here bitches")
		-- 					-- end
		-- 					return client.name == "null_ls"
		-- 				end,
		-- 				bufnr = bufnr,
		-- 			})
		-- 		end,
		-- 	})
		-- end

		-- All files auto format on save
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							-- if vim.bo.filetype == "powershell" then
							-- 	print("we in here bitches")
							-- end
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
