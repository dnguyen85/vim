set background=dark
set nocompatible
colorscheme ir_black
" syntax enable
syntax on

filetype plugin on
filetype indent on

set autoindent
set smartindent

" Set folding
" set foldmethod=syntax

" set foldlevelstart=1
" Space to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
map Z zO

" Map changing directory to current file location
map <F2> :lcd %:p:h<CR>

" Pathogen
call pathogen#infect()

" Set font
"set guifont=Terminus\ 8
set guifont=Bitstream\ Vera\ Sans\ Mono\ 9
" set guifont=Ubuntu\ Mono\ 11

" Set window size
set lines=40 columns=140

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

" map <F12> :set nu!<CR>
" highlight LineNr ctermfg=6 ctermbg=9
set printoptions=number:y

" Run Make with F5/F6
map <F5> :make<CR>
map <F6> :make test<CR>

" Typing jj quickly escapes out of INSERT mode
imap jj <Esc>

" Comment/Uncomment selected lines
if exists("b:commentsub")
    map <F4> :s/^/{b:commentsub}/<CR>
    map <F3> :s/^\(\s*\){b:commentsub}/\1/<CR>
endif

" Save history options?
set viminfo='20,"500

" map <F6> :set foldmethod=syntax<CR>
" map <F7> zO
" map <F8> zC

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

" Maps to switch vim tabs
"map <C-k> gT
"map <C-j> gt
map <S-tab> <C-tab>

" For ctags
" Vertical split open
map <A-]> :vsp <CR> <C-w>l :exec("tag ".expand("<cword>"))<CR>
map <C-x><C-x><C-T> :!ctags --extra=+f -R --sort=1 --c-kinds=+px -f ~/.vim/tags/commontags /usr/include /usr/local/include<CR><CR>
map <C-x><C-x><C-R> :!ctags --extra=+f -R *<CR><CR>

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
map <C-Q> :Bclose<CR>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapAltNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplTabWrap = 1
hi link MBEVisibleChanged StatusLine
hi link MBEVisibleNormal  StatusLine
hi link MBENormal         Folded
hi link MBEChanged        Error 

" EnhancedCommentify plugin
let g:EnhCommentifyRespectIndent = 'yes'
let g:EnhCommentifyPretty = 'yes'
let g:EnhCommentifyAlignRight = 'yes'
let g:EnhCommentifyUseAltKeys = 'yes'

" Project plugin flags
let g:proj_flags="imstvg"
let g:proj_window_width = 30

" Taglist plugin maps
let Tlist_Ctags_Cmd='/usr/bin/ctags'
nnoremap <silent> <F11> :TlistToggle<CR> 
"map T :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Enable_Fold_Column = 0 " No Fold Column
let Tlist_Sort_Type = "name" " Sort tags by name
let Tlist_WinWidth = 25
let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures;s:signals;v:variables;g:generic maps;h:generic maps id;m:port maps;n:port maps id;q:components;c:constants;l:constants type;u:sub types'
let g:tlist_tex_settings = 'latex;s:sections;g:graphics;l:labels;r:refs;p:page refs;b:bibitems'

" SuperTab plugin
let g:SuperTabDefaultCompletionType = "<c-X><c-U>"
let g:SuperTabMappingForward = '<S-CR>'
let g:SuperTabMappingBackward = '<C-S-CR>'

" Eclim plugin
nnoremap <silent> <buffer> <cr> :CSearchContext<cr>
let g:EclimTaglistEnable = 0

" FuzzyFinder plugin
" map <leader>t :FuzzyFinderTextMate<CR>
" map <leader>r :FuzzyFinderTextMateRefreshFiles<CR>
" map <leader>s :let g:fuzzy_roots=['.']

" Tab completion acts more like bash, presenting list of options
set wildmode=longest,list

" Map windows switching to ww
map W <C-w>
map F <C-f>
map B <C-b>

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
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*
" OPTIONAL: This enables automatic indentation as you type.
filetype indent on
" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" For pdf as default compilation, otherwise, use :TCTarget pdf to change on the fly
" let g:Tex_DefaultTargetFormat='pdf'
"  let g:Tex_MultipleCompileFormats='dvi,pdf'
let g:Tex_ViewRule_dvi='okular'
let g:Tex_ViewRule_pdf='acroread'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -R0 -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'

let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_Leader = ','

" Latex paragraph map
omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>

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
let g:vimwiki_use_mouse = 1
" Do not let WikiWord to be a link
let g:vimwiki_camel_case = 0
hi VimwikiHeader1 guifg=#B40404
hi VimwikiHeader2 guifg=#00FF00
hi VimwikiHeader3 guifg=#0000FF
hi VimwikiHeader4 guifg=#FF00FF
hi VimwikiHeader5 guifg=#00FFFF
hi VimwikiHeader6 guifg=#FFFF00
let g:vimwiki_hl_headers = 1
let g:vimwiki_list = [{'path': '~/Dropbox/www/wiki_files/',
                     \ 'path_html': '~/Dropbox/www/wiki', 
                     \ 'auto_export' : 0,
                     \ 'template_path': '~/Dropbox/www/',
                     \ 'template_default': 'template', 
                     \ 'nested_syntaxes' : {'python': 'python', 'c++': 'cpp'}}]
" Remap find previous link on current page
map <leader>wb :VimwikiAll2HTML<CR><CR>
" Set the open search list shortcut
map <leader>lo :lopen<CR>
map <leader>ln :lnext<CR>

" Map <F6> to insert images string in insert mode
inoremap <F6> <C-R>=strftime("images/%m_%d_%Y_img")<CR>
" Map <F5> to insert time stamp in insert mode
inoremap <F5> <C-R>=strftime("(%H:%M) - ")<CR>
" Map <F4> to insert Date stamp in insert mode
inoremap <F4> <C-R>=strftime("==== %m/%d/%Y ====\n")<CR>

" Use mouse in terminal vim
set mouse=a


