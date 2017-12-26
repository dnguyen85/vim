nnoremap <silent> <buffer> <cr> :CSearchContext<cr>
nnoremap <silent> <buffer> <s-cr> :vsp <cr> <c-w>l :CSearchContext<cr> <c-w>j :q<cr>
nnoremap <silent> <buffer> <C-cr> "*yaw:CSearchContext <C-r>*<CR>
vnoremap <silent> <buffer> <cr> :<BS><BS><BS><BS><BS>CSearchContext <C-r>*<CR>
