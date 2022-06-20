-- VimWiki global before initializing
vim.cmd("let g:vimwiki_global_ext = 0")
vim.cmd("let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}")
vim.cmd(
	"let g:vimwiki_list = [{'path': '~/vimwiki', 'template_path': '~/vimwiki/templates/', 'template_default': 'default', 'syntax': 'markdown', 'ext': '.md', 'path_html': '~/vimwiki/site_html/', 'custom_wiki2html': 'vimwiki_markdown', 'template_ext': '.tpl'}]"
)

-- https://github.com/vimwiki/vimwiki/issues/283#issuecomment-517906961
-- Fixes autocomplete on vimwiki
vim.cmd(
	[[autocmd FileType vimwiki inoremap <silent> <buffer> <expr> <CR>   pumvisible() ? "\<CR>"   : "<Esc>:VimwikiReturn 1 5<CR>"]]
)
vim.cmd(
	[[autocmd FileType vimwiki inoremap <silent> <buffer> <expr> <S-CR> pumvisible() ? "\<S-CR>" : "<Esc>:VimwikiReturn 2 2<CR>"]]
)
