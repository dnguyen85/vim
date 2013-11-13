" Pathogen
call pathogen#infect()
call pathogen#helptags()

set background=dark
colorscheme solarized
"colorscheme ir_black

set nocompatible
syntax enable
syntax on

filetype plugin on
filetype indent on

set autoindent
set smartindent

set ignorecase
set smartcase

" Set folding
" set foldmethod=syntax

if has("gui_running")
    " Set window size
    set lines=40 columns=140
else
    " VIM only, no GVIM
    " Detect file change
    au FileChangedShell * echo "Warning: File changed on disk"
endif

" set foldlevelstart=1
" Space to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
map Z zO

" Map changing directory to current file location
map <F2> :lcd %:p:h<CR>

" Set font
"set guifont=Terminus\ 8
"set guifont=Deja\ Vu\ Sans\ Mono\ 9  -- This has a bug with italics being cut off
set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
" set guifont=Ubuntu\ Mono\ 11

" Tabs are 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set modeline

" Search options
set showmatch
" Search highlight
set nohls
" set hlsearch
set incsearch

" Line wrapping
set textwidth=80

" Press F9 to toggle Paste mode during insert
set pastetoggle=<f9>

" Line numbers on the left
set nu

" Set scroll
set scrolloff=3

" Set Shift-Tab to reverse Tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

" map <F12> :set nu!<CR>
" highlight LineNr ctermfg=6 ctermbg=9
set printoptions=number:y

" Run Make with F5/F6
" map <F5> :make<CR>
" map <F6> :make test<CR>

" Typing jj quickly escapes out of INSERT mode
imap jj <Esc>

" Save history options?
set viminfo='20,"500

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
 au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
   \| exe "normal g'\"" | endif
endif

au BufRead,BufNewFile *.vh4             setfiletype vhdl
au BufRead,BufNewFile *.vhh             setfiletype vhdl

" Syntax highlight tabs as error
au BufRead,BufNewFile * syn match TAB_CHAR "\t"
"hi link TAB_CHAR Error
map <F8> :hi link TAB_CHAR Normal<CR>

" For ctags
" Vertical split open
map <A-]> :vsp <CR> <C-w>l :exec("tag ".expand("<cword>"))<CR>
map <C-x><C-x><C-T> :!ctags -R --sort=1 --c-kinds=+px -f ~/.vim/tags/commontags /usr/include /usr/local/include<CR><CR>
map <C-x><C-x><C-R> :!ctags -R *<CR><CR>

" For gf gotoFile in vertical split
" Remember to :set path+=../**
map <leader>s :set path=.,,..,../..,./*,./*/*,../*,~/,~/**,/usr/include/*<CR>
map gF :vsp <CR> <C-w>l gf

" Set tag search dir
set tags+=./tags;
set tags+=tags;
set tags+=~/.vim/tags/commontags

" Map for cut and paste
map <C-V> "+gP
cmap <C-V> <C-R>+
vnoremap <C-X> "+x
vnoremap <C-C> "+y

" Map leader
let mapleader = ","
  
" MiniBufExplorer plugin
" Map <C-Q> to close buffer
let g:miniBufExplMapWindowNavVim = 1 " Obsolete
let g:miniBufExplMapAltNavVim = 1    " Obsolete
let g:miniBufExplMapCTabSwitchBufs = 1 " Obsolete
let g:miniBufExplTabWrap = 1
let g:miniBufExplForceSyntaxEnable = 1
"hi link MBEVisibleChanged StatusLine
"hi link MBEVisibleNormal  StatusLine
"hi link MBENormal         Folded
"hi link MBEChanged        Error 
" New mappings for MBE 
noremap <C-TAB>   :bn<CR>
noremap <C-S-TAB> :bp<CR>
noremap <C-Q>     :MBEbd<CR>
" Command mappings
cnoreabbrev BD MBEbd
cnoreabbrev BW MBEbw
cnoreabbrev BU MBEbun

" CtrlP plugin
" let g:ctrlp_map= '<leader>t'
nnoremap <leader>t :CtrlPTag<CR>
" Try to reuse window elsewhere for opened files
let g:ctrlp_switch_buffer = 'Et'
" CWD for CtrlP: git dir, or current dir, or current file dir if current dir is not ancestor
let g:ctrlp_working_path_mode = 'ra' 
" Use Caching
let g:ctrlp_use_caching = 1
" Set ignored folders
set wildignore+=*/tmp/*,*.so,*.swp,*.zip\time,*/.git/*,*/.hg/*,*/.svn/*  
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_extensions = ['tag']

" Hide the status bar for ctrlp
let g:ctrlp_buffer_func = {
    \ 'enter': 'Function_Name_1',
    \ 'exit':  'Function_Name_2',
    \ }

func! Function_Name_1()
    set laststatus=0
endfunc

func! Function_Name_2()
    set laststatus=2
endfunc

" End CtrlP plugin 

" MiniBufExpl Colors
hi MBEVisibleActive guifg=#A6DB29 guibg=fg
hi MBEVisibleChangedActive guifg=#F1266F guibg=fg
hi MBEVisibleChanged guifg=#F1266F guibg=fg
hi MBEVisibleNormal guifg=#5DC2D6 guibg=fg
hi MBEChanged guifg=#CD5907 guibg=fg
hi MBENormal guifg=#808080 guibg=fg

" EnhancedCommentify plugin
let g:EnhCommentifyRespectIndent = 'yes'
let g:EnhCommentifyPretty = 'yes'
let g:EnhCommentifyAlignRight = 'yes'
let g:EnhCommentifyUseAltKeys = 'yes'
let g:EnhCommentifyUseBlockIndent = 'yes'

" Project plugin flags
let g:proj_flags="imstvg"
let g:proj_window_width = 30

" Taglist/Tagbar plugin maps
nnoremap <silent> <F11> :TagbarToggle<CR> 
"let g:tagbar_left = 1
"let g:tagbar_width = 30
let g:tagbar_indent = 1
let g:tagbar_autoshowtag = 1
"let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures;s:signals;v:variables;g:generic maps;h:generic maps id;m:port maps;n:port maps id;q:components;c:constants;l:constants type;u:sub types'
"let g:tlist_tex_settings = 'latex;s:sections;g:graphics;l:labels;r:refs;p:page refs;b:bibitems'

" Fugitive plugin
cnoreabbrev Gs Gstatus
" Mapping of navigating from blob or tree buffers
nnoremap << :edit %:h<CR> 

" SuperTab plugin
let g:SuperTabDefaultCompletionType = "<c-X><c-U>"
let g:SuperTabMappingForward = '<S-CR>'
let g:SuperTabMappingBackward = '<C-S-CR>'

" Eclim plugin
nnoremap <silent> <buffer> <cr> :CSearchContext<cr>
let g:EclimTaglistEnable = 0

" Tab completion acts more like bash, presenting list of options
set wildmode=longest,list

" Map windows switching to ww
" Do not use bash ctrl-ja
let g:BASH_Ctrl_j='off'
let g:C_Ctrl_j='off'
noremap W <C-W>
noremap F <C-F>
noremap B <C-B>
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l



" C-F1, C-F2, C-F3 to toggle menu bar, tool bar, and scroll bar, default to hidden
set guioptions-=m " remove menu bar
set guioptions-=T " remove tool bar
set guioptions-=r " remove right hand scroll bar
set guioptions-=R " remove right hand scroll bar for vertically split windows
set guioptions-=l " remove left hand scroll bar
set guioptions-=L " remove left hand scroll bar for vertically split windows
set guioptions-=b " remove bottom / horizontal scrollbar
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>

" Latex Processing
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" For pdf as default compilation, otherwise, use :TCTarget pdf to change on the fly
let g:Tex_DefaultTargetFormat='pdf'
" Critical for compiling w/ bibtex for pdflatex
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_ViewRule_dvi='okular --unique'
let g:Tex_ViewRule_pdf='okular --unique'
let g:Tex_CompileRule_dvi = 'latex -shell-escape -synctex=1 -src-specials -interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -R0 -o $*.ps $*.dvi'
"let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
let g:Tex_CompileRule_pdf = 'pdflatex -shell-escape -synctex=1 -src-specials -interaction=nonstopmode $*'
"let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_Leader = ','
let g:Tex_GotoError=0
" Use symbol math
let g:Tex_UseUtfMenus = 1
"let g:Tex_IgnoredWarnings = 
"            \"Underfull\n".
"            \"Overfull\n".
"            \"specifier changed to\n".
"            \"You have requested\n".
"            \"Missing number, treated as zero.\n".
"            \"There were undefined references\n".
"            \"Citation %.%# undefined\n".
"            \"Reference %.%# undefined\n".
"            \"Latex Font Warning:"
" Increase the number of warnings ignored
"let g:Tex_IgnoreLevel = 9

function! SyncTexForward()
let s:syncfile = fnamemodify(fnameescape(Tex_GetMainFileName()), ":r").".pdf"
let execstr = "silent !okular --unique ".s:syncfile."\\#src:".line(".").expand("%\:p").' &'
exec execstr
endfunction
nnoremap <leader>lf :call SyncTexForward()<CR>

" Latex paragraph map
omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.

" Latex jump forward map   
" imap ;; <Plug>IMAP_JumpForward


" Spell checking
" map <F10> :setlocal spell!<CR>
" set spelllang=en_us
" highlight clear SpellBad
" highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
" highlight clear SpellCap
" highlight SpellCap term=underline cterm=underline
" highlight clear SpellRare
" highlight SpellRare term=underline cterm=underline
" highlight clear SpellLocal
" highlight SpellLocal term=underline cterm=underline

" Vimwiki stuff
let g:vimwiki_html_header_numbering_sym = '.'
let g:vimwiki_html_header_numbering = 4
let g:vimwiki_use_mouse = 1
let g:vimwiki_browsers=['google-chrome']
" Do not let WikiWord to be a link
let g:vimwiki_camel_case = 0
hi VimwikiHeader1 guifg=#FDF6E3
hi VimwikiHeader2 guifg=#CB4B16
hi VimwikiHeader3 guifg=#2AA198
hi VimwikiHeader4 guifg=#B58900
hi VimwikiHeader5 guifg=#268BD2
hi VimwikiHeader6 guifg=#FDF6E3
let g:vimwiki_hl_headers = 1
let g:vimwiki_list = [{'path': '~/Dropbox/www/wiki_files/',
                     \ 'path_html': '~/Dropbox/www/wiki', 
                     \ 'auto_export' : 0,
                     \ 'template_path': '~/Dropbox/www/',
                     \ 'template_default': 'template', 
                     \ 'nested_syntaxes' : {'python': 'python', 'c++': 'cpp', 'c': 'cpp', 'css': 'css', 'js': 'javascript', 'javascript': 'javascript', 'html': 'html', 'matlab': 'matlab'}}]
" Remap find previous link on current page
map <leader>wb :VimwikiAll2HTML<CR><CR>
" Remap convert page and open link (Note: this has been moved to inside vimwiki plugin
map <leader>wc :cd /home/dhn24/Dropbox/www/wiki_files<CR>
" Set the open search list shortcut
map <leader>lo :lopen<CR>
map <leader>ln :lnext<CR>

" Map <F3> to insert time stamp in insert mode
inoremap <F3> <C-R>=strftime("(%H:%M) ")<CR>
" Map <F4> to insert Date stamp in insert mode
inoremap <F4> <C-R>=strftime("==== %m/%d/%Y ====\n")<CR>
" Map <F6> to insert images string in insert mode
inoremap <F6> <C-R>=strftime("images/%m_%d_%Y_img")<CR>

" Use mouse in terminal vim
set mouse=a


