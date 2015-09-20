" Diffchar nmap
nmap [a <Plug>JumpDiffCharPrevStart 
nmap ]a <Plug>JumpDiffCharNextStart 
nmap [A <Plug>JumpDiffCharPrevEnd
nmap ]A <Plug>JumpDiffCharNextEnd

nnoremap <C-B> :CtrlPBuffer<CR>

" IMAP settings, syntax is (lhs, rhs, filetype for mapping)
" call IMAP ('()', '(<++>)<++>', "")
" call IMAP ('[]', '[<++>]<++>', "")
" call IMAP ('{}', '{<++>}<++>', "")

hi Folded term=bold gui=bold



