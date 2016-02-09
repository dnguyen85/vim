" Settings for composing mail

" Don't insert line breaks on textwidth
setlocal textwidth=0
setlocal wrapmargin=0

" Soft wrap text at 80 char, or terminal width
setlocal wrap
" Prevent word from being breaking up in the middle
setlocal linebreak 
" Don't display special characters
setlocal nolist

" Call Goyo
au VimEnter * if exists(":Airline") | Goyo 80 | endif

