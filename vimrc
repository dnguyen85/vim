" Should I load minibuf (disabled for splice)?
if exists('nominibuf')
    let g:pathogen_disabled = ['minibufexpl']
endif

if exists('nodiffchar')
    let g:pathogen_disabled = ['diffchar.vim']
endif

" Pathogen
call pathogen#infect()
call pathogen#helptags()

" Colorscheme
set background=dark
colorscheme solarized

" Toggle background key to use F5
call togglebg#map("")
"colorscheme ir_black

set nocompatible " Be iMproved, not compatible w/ vi
syntax enable
syntax on

filetype plugin on
filetype indent on
filetype plugin indent on

set autoindent
set smartindent

" Run matchit
runtime macros/matchit.vim

" Disable smartindent in python file. Don't need the auto indenting after '{'
au! FileType python setl nosmartindent

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
    set updatetime=1000
    au CursorHold * if getcmdwintype() == '' | checktime | endif
endif

" Auto smooth scrolling
map F <C-f>
map B <Plug>(ac-smooth-scroll-c-b)
vmap B <Plug>(ac-smooth-scroll-c-b_v)

" set foldlevelstart=1
" Space to toggle folds
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>

" Map changing directory to current file location
" map <leader>l :lcd %:p:h<CR>

" Set font
"set guifont=Terminus\ 8
" -- This has a bug with italics being cut off
set guifont=Deja\ Vu\ Sans\ Mono\ for\ Powerline\ 10 
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 9

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

" Text should be wrap if too long
set wrap

" Press F9 to toggle Paste mode during insert
set pastetoggle=<f9>

" Line numbers on the left
set nu

" Set scroll
set scrolloff=3

" Set Shift-Tab to reverse Tab
" nmap <S-Tab> <<
" imap <S-Tab> <Esc><<i

" map <F12> :set nu!<CR>
" highlight LineNr ctermfg=6 ctermbg=9
set printoptions=number:y

" Run Make with F5/F6
" map <F5> :make<CR>
" map <F6> :make test<CR>

" Goyo reading
map <F5> :Goyo<CR>

" Typing jj quickly escapes out of INSERT mode
imap jk <Esc>

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
"map <F8> :hi link TAB_CHAR Normal<CR>

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
" Use C-Q to do what C-V normally do. Note: no recursive map here
noremap <C-Q> <C-V>
" Map C-V recursively
map <C-V> "+gP
cmap <C-V> <C-R>+
vnoremap <C-X> "+x
vnoremap <C-C> "+y

" Map leader
let mapleader = ","
  
" MiniBufExplorer plugin
" Map <C-Q> to close buffer
let g:miniBufExplTabWrap = 1
let g:miniBufExplForceSyntaxEnable = 1
" Coloring
" Go into repo, checkout master and do a merge with color_fix

" New mappings for MBE 
"nnoremap <C-TAB>   :bn<CR>
" nnoremap <C-S-TAB> :bp<CR>
" Command mappings
cnoreabbrev BD MBEbd
cnoreabbrev BW MBEbw
cnoreabbrev BU MBEbun
cnoreabbrev AU au BufWritePost <buffer> Vimwiki2HTML 
cnoreabbrev NAU au! BufWritePost <buffer> 

" CtrlP plugin
nnoremap <C-B> :CtrlPBuffer<CR>
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
let g:EnhCommentifyUseAltKeys = 'no'
let g:EnhCommentifyUseBlockIndent = 'yes'

" Taglist/Tagbar plugin maps
nnoremap <silent> <F11> :TagbarToggle<CR> 
nnoremap <silent> <leader>t :TagbarOpen fj<CR> 
let g:tagbar_indent = 1
let g:tagbar_autoshowtag = 1
"let g:tlist_vhdl_settings   = 'vhdl;d:package declarations;b:package bodies;e:entities;a:architecture specifications;t:type declarations;p:processes;f:functions;r:procedures;s:signals;v:variables;g:generic maps;h:generic maps id;m:port maps;n:port maps id;q:components;c:constants;l:constants type;u:sub types'
"let g:tlist_tex_settings = 'latex;s:sections;g:graphics;l:labels;r:refs;p:page refs;b:bibitems'

" Fugitive plugin
cnoreabbrev Gs Gstatus
" Mapping of navigating from blob or tree buffers
" nnoremap << :edit %:h<CR> 
if has("autocmd")
    autocmd BufReadPost fugitive://* set bufhidden=delete
endif
" Use fugitive statusline instead of vim-airline
" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Eclim plugin
nnoremap <silent> <buffer> <cr> :CSearchContext<cr>
let g:EclimTaglistEnable = 0

" Tab completion acts more like bash, presenting list of options
set wildmode=longest,list

" Map windows switching to ww
" Do not use bash ctrl-j
let g:BASH_Ctrl_j='off'
let g:C_Ctrl_j='off'
nnoremap <C-j>     <C-W>j
nnoremap <C-k>     <C-W>k
nnoremap <C-h>     <C-W>h
nnoremap <C-l>     <C-W>l

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

" List of wikis
let wiki_1 = {}
let wiki_1.path = '~/Dropbox/www/wiki_files/'
let wiki_1.path_html = '~/Dropbox/www/wiki/'
let wiki_1.auto_export = 0
let wiki_1.template_path = '~/Dropbox/www/wiki_assets/'
let wiki_1.template_default = 'template'
let wiki_1.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'cpp', 'css': 'css', 'js': 'javascript', 'javascript': 'javascript', 'html': 'html', 'matlab': 'matlab'}

let wiki_2 = {}
let wiki_2.path = '~/Dropbox/Papers/'
let wiki_2.path_html = '~/Dropbox/Papers/'
" let wiki_2.ext = '.wiki'
let wiki_2.auto_export = 0
let wiki_2.template_path = '~/Dropbox/wiki_assets/'
let wiki_2.template_default = 'template'
let wiki_2.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'cpp', 'css': 'css', 'js': 'javascript', 'javascript': 'javascript', 'html': 'html', 'matlab': 'matlab'}

let g:vimwiki_list = [wiki_1, wiki_2]

" let g:vimwiki_list = [{'path': '~/Dropbox/www/wiki_files/',
"                      \ 'path_html': '~/Dropbox/www/wiki', 
"                      \ 'auto_export' : 0,
"                      \ 'template_path': '~/Dropbox/www/',
"                      \ 'template_default': 'template', 
"                      \ 'nested_syntaxes' : {'python': 'python', 'c++': 'cpp', 'c': 'cpp', 'css': 'css', 'js': 'javascript', 'javascript': 'javascript', 'html': 'html', 'matlab': 'matlab'}}]

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
inoremap <F6> <C-R>=strftime("files/%Y_%m_%d_img")<CR>

" Slime plugin
let g:slime_target = "tmux"

" NERD Tree plugin
" let g:NERDTreeBookmarksFile = "/home/dhn24/Dropbox/Research/work_files/NERDTreeBookmarks"
" let g:NERDTreeShowBookmarks = 1
if has("autocmd")
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif
map <F12> :NERDTreeToggle<CR>

" TernJS Javascript plugin
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

""" Neocomplete Setting Starts
" Enabled at startup?
" let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1


" imap <CR> to simply go to next line
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction

" imap smart <C-h>, <BS>: close popup and delete backword char, no more popups
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" <C-y> to close popup
inoremap <expr><C-y>  neocomplete#close_popup()
" <C-e> to cancel popup - same as <C-g>
inoremap <expr><C-e>  neocomplete#cancel_popup()
" <C-g> to undo completion
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Set omnicompletion functions (called by neocomlcache
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Use jedi-vim' omnicompletion for python files, instead of neocomplcache
" For python: use jedi-vim omnicompletion instead
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python setlocal omnifunc=jedi#completions

" Should neocomlcache override other plugin's `completefunc` (User completion mode)
" let g:neocomplcache_force_overwrite_completefunc = 1
" Disable jedi-vim auto_vim_configuration
let g:jedi#auto_vim_configuration = 0
" Disable forcing omnicompletion, can be overriden by any plugin (see below)
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
" Auto-use omnicompletion instead of usercomplete on certain patterns, such as 'dot' (overriding jedi-vim behavior)
let g:neocomplete#force_omni_input_patterns.python = '[^. \t]\.\w*'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

""" Neocomplete Setting Stops

""" Neosnippet plugin
" C-k to select-and-expand a snippet from Neocomplcache popup (Use C-n and C-p
" to select), C-k also jumps to next field in snippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Use Honza's snippets
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Snippets for mako filetype
let g:neosnippet#scope_aliases = {}
let g:neosnippet#scope_aliases['mako'] = 'mako,html'
let g:neosnippet#scope_aliases['rst'] = 'rst,html'
let g:neosnippet#scope_aliases['pandoc'] = 'pandoc,markdown,html'
let g:neosnippet#scope_aliases['vimwiki'] = 'html'

""" vim-jedi settings 
" Should I do dot completion?
let g:jedi#popup_on_dot = 0
" Use buffer instead of tab for doc string
let g:jedi#use_tabs_not_buffers = 0
"" Default mappings
" Go to assignment of variable
let g:jedi#goto_assignments_command = "<leader>g"
" Go to definition of variable
let g:jedi#goto_definitions_command = "<leader>d"
" Show docs string of variable
let g:jedi#documentation_command = "K"
" Show all usage of current variable
let g:jedi#usages_command = "<leader>n"
" Start completion
let g:jedi#completions_command = "<C-Space>"
" Rename command
let g:jedi#rename_command = "<leader>r"
" show call signature
let g:jedi#show_call_signatures = "1"

"" vim-airline
" Set this to enable bottom airline by default
set laststatus=2
" Use powerline font
let g:airline_powerline_fonts = 1
" Disable whitespace check
let g:airline_detect_whitespace = 0
" Enable tab line
" let g:airline#extensions#tabline#enabled = 1
" Hide the tab type
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#close_symbol = 'X'
" Setting buffer divider
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = '|'
" Show the buffer number
" let g:airline#extensions#tabline#buffer_nr_show = 1
" Eliminate the space between buffer number
" let g:airline#extensions#tabline#buffer_nr_format = '%s:'
" Set min buffers to start showing tabline
" let g:airline#extensions#tabline#buffer_min_count = 2
" Use the `unique_tail` (or `unique_tail_improved` algorithm to display buffer
" let g:airline#extensions#tabline#formatter = 'unique_tail'

"" Syntastic Syntax checker
" Always populate location list for latex
au! FileType tex let g:syntastic_always_populate_loc_list = 1
" Check header files
let g:syntastic_cpp_check_header = 1

"## diffchar plugin
let g:DiffUnit = "Word1"
" auto diffupdate
let g:DiffUpdate = 1

"## DirDiff settings
" exclude folder and files
let g:DirDiffExcludes = ".git,*.swp,*~,~*"

" ignore lines with patterns
" let g:DirDiffIgnore = 

" Don't flag files as different based on whitespace
let g:DirDiffAddArgs = "-w"

"## End DirDiff

"## Diffmode settings using 'au FilterWritePre * if &diff'

" Set wrap automatically in vimdiff
au FilterWritePre * if &diff | setlocal wrap< | endif

" When in diffmode suppress annoying auto-folding (filler,context:1000) and don't check for white space differences
au FilterWritePre * if &diff | exe 'set diffopt=filler,context:1000,iwhite' | exe 'execute "normal \<c-w>\<c-w>"' | endif 

"## End Diffmode settings

" Voom settings
" let g:voom_tree_placement = "right"

" Vim origami
let g:OrigamiSeparateLevels = 1
autocmd FileType matlab set foldmethod=marker

" Show the stack of syntax hilighting classes affecting whatever is under the
" cursor.
function! SynStack()
    echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc

" Pandoc mapping
map <localleader>c :Pandoc #article<CR>
map <localleader>r :Pandoc revealjs<CR>
let g:pandoc#formatting#mode = 'ha'
let g:pandoc#formatting#textwidth = 80

" Vertical split and open buffer 
function! VerticalSplitBuffer(buffer)
    execute "vert belowright sb" a:buffer 
endfunction

" Vertical split and open buffer (mapping)
command -nargs=1 Vbuffer call VerticalSplitBuffer(<f-args>)

" Use mouse in terminal vim
set mouse=a
