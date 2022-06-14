vim.cmd([[
"Config

let g:coc_current_word_highlight_delay = 0

" autocmd BufAdd NERD_tree_*,your_buffer_name.rb,*.js :let b:coc_current_word_disabled_in_this_buffer = 1
autocmd BufAdd NERD_tree_* :let b:coc_current_word_disabled_in_this_buffer = 1
]])
