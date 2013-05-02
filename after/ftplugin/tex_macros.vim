" Danh's Macro
" \mathbf
call IMAP (g:mapleader.'BF', "\\mathbf{<++>}<++>", 'tex')
" \mathbb
call IMAP (g:mapleader.'BB', "\\mathbb{<++>}<++>", 'tex')
" \text
call IMAP (g:mapleader.'TE', "\\text{<++>}<++>", 'tex')
" \textbf
call IMAP (g:mapleader.'TB', "\\textbf{<++>}<++>", 'tex')
" \textit
call IMAP (g:mapleader.'TI', "\\textit{<++>}<++>", 'tex')
" Override AUCTEX
call IMAP('`w', '\omega', 'tex')

