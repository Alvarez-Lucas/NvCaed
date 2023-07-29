return {
	{
		enabled = true,
		"vimwiki/vimwiki",
		ft = "vimwiki",
		cmd = "VimwikiIndex",
		keys = {
			{ "<leader>ww", "<cmd>VimwikiIndex<cr>", desc = "" },
			{ "<,>", "<cmd>VimwikiIndex<cr>", desc = "" },
		},
		--
		init = function()
			-- VimWiki global before initializing
			vim.cmd("let g:vimwiki_global_ext = 0")
			vim.cmd("let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}")
			vim.cmd(
				"let g:vimwiki_list = [{'path': '~/vimwiki', 'template_path': '~/vimwiki/templates/','listsyms' : ' oOx', 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md', 'path_html': '~/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown', 'template_ext': '.tpl'}]"
			)
		end,
	},
}
