" TODO http://nvie.com/posts/how-i-boosted-my-vim/
" TODO http://lyuts.net/blog/2010/01/vim-ide
" TODO ctags and or taglist
" TODO nerdtree
" TODO cscope
" TODO http://blog.sanctum.geek.nz/category/vim/
" TODO http://code.google.com/p/vimcolorschemetest/
" TODO http://vi-improved.org/vimrc.html
" TODO http://blog.copyninja.info/2010/02/cc-auto-complete-for-vim.html

"""" First of all
" Pathogen loads plugins as modules
  filetype off
  "call pathogen#runtime_append_all_bundles()
  call pathogen#incubate()

  " turns on syntax omnicomple a la ctrl+x ctrl+o
  filetype plugin on
  set ofu=syntaxcomplete#Complete

 " Source the vimrc file after saving it
  "if has("autocmd")
  "  autocmd bufwritepost .vimrc source $MYVIMRC
  "endif

" basics {{{
  syntax on
  set number                           " show line numbers
  set ruler                            " current line number on status bar
  set nowrap                           " no line wrapping
  set nocompatible                     " this is not vi
  set autoindent smartindent           " auto/smart indent
  set tabstop=2 shiftwidth=2 expandtab " default tab stops
  set scrolloff=5                      " keep at least 5 lines below/above cursor
  set sidescrolloff=5                  " keep at least 5 lines left/right of cursor
  set mouse=a                          " use mouse everywhere
  "set backupdir=~/.vim/backup          " where to put backup files
  set autochdir                        " always switch to the current file directory
  "set directory=~/.vim/tmp             " directory to place swap files in
  set cursorline                       " highlight current line
  "set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
  "set statusline=%f%m%r%h%w\ %L\ %y\ [%p%%][%04l,%04v]
	set statusline=%<%f\ %y\ %h%m%r%=%-14.(%l,%c%V%)\ %P\ %nb
  set laststatus=2
  "}}}

  " disabled {{{
    "set cpoptions=eA
    "set lazyredraw                      " not always useful
    "set list

  " highlighting
    "highlight Comment guifg=Orange
    "highlight CursorLine guibg=Black
 "}}}

  " gui and color settings {{{
  if &term=~'linux' " here we only got a nongraphic terminal - no colors
    colorscheme default
  else
    "colorscheme lucius " working much with c++ lately
    "colorscheme mustang" working much with c++ lately
    colorscheme jellybeans
    "colorscheme molokai_original
    "colorscheme summerfruit256
    "colorscheme martin_krischik
    "colorscheme Monokai
    
    if has("gui_running") " everything you want from your gui

      "" GitGutter
      "let g:gitgutter_enabled = 0

      "" Colorschemes and Fonts
      "set guifont=Monospace\ 9
      "set guifont=FreeMono\ 10
      "set guifont=DejaVu\ Sans\ Mono\ 10
      set guifont=Source\ Code\ Pro\ 10
      "set guifont=Droid\ Sans\ Mono\ 10
      "colorscheme distinguished
      colorscheme eddie
      
      "" Menu
      " 'a' autoselect ( for copy and pasting )
      " 'c'	Use console dialogs instead of popup dialogs for simple choices.
      " 'm'	Menu bar is present.
      " 't'	Include tearoff menu items.  Currently only works for Win32, GTK+, and Motif 1.2 GUI.
      set guioptions=Taec " ace, mace, Tace, Tacet

      "" Airline
      let g:airline_powerline_fonts = 1
      let g:airline_detect_whitespace=0 "disabled
      "let g:airline_detect_whitespace=2 "icon only
      let g:airline_theme='jellybeans'
      let g:airline_theme='molokai'

      set mousehide
    else
      set t_Co=256
      set mouse=a
    endif
  endif
  " }}}

  " magic indent plugin for many languages
  filetype indent plugin on

" Formating helpers {{{
  au BufRead,BufNewFile *.py,*.pyw    set shiftwidth=4 tabstop=4 smarttab expandtab softtabstop=4 listchars=tab:>.,trail:.,extends:#,nbsp:.
  au BufRead,BufNewFile .vimrc,vimrc  set shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2
  au BufRead,BufNewFile *.css         set shiftwidth=4 tabstop=4 smarttab expandtab softtabstop=4 listchars=tab:>.,trail:.,extends:#,nbsp:.
  au BufRead,BufNewFile *.js,*.java   set shiftwidth=2 tabstop=4 smarttab expandtab softtabstop=4
  au BufRead,BufNewFile *.coffee      set shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2 listchars=tab:>.,trail:.,extends:#,nbsp:.
  au BufNewFile,BufRead *.as          set filetype=actionscript

  au Filetype cpp set shiftwidth=2 tabstop=2 smarttab expandtab softtabstop=2
" }}}

" folding {{{
  au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.js,*.java  nmap <F6> /}<CR>zf%<ESC>:nohlsearch<CR>
  au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h,*.hh,*.js,*.java  setl foldmethod=marker foldmarker={,} nofoldenable 
  au BufNewFile,BufReadPost *.coffee  setl foldmethod=indent foldenable
  au BufNewFile,BufReadPost *.rb      setl foldmethod=indent foldenable
  au BufNewFile,BufReadPost *.py      setl foldmethod=indent foldenable
  au BufNewFile,BufReadPost *.yml     setl foldmethod=indent foldenable
  au Filetype vim set foldmethod=marker
  " }}}

" Taglist {{{
  let Tlist_Compact_Format = 0
  let Tlist_GainFocus_On_ToggleOpen = 1
  let Tlist_Close_On_Select = 0
  let Tlist_WinWidth = 38
	nnoremap <silent> <F9> :TlistToggle<CR>
  "}}}

  " Markdown {{{
  au Filetype markdown setlocal spell
  au Filetype markdown setlocal wrap
  au Filetype markdown setlocal linebreak
  au Filetype markdown setlocal nolist
  au Filetype markdown setlocal columns=80
  au Filetype markdown setlocal mousemodel=popup
  " }}}


" Spell checking   {{{
"if version >= 700
"  hi clear SpellBad
"  hi clear SpellCap
"  hi clear SpellRare
"  hi clear SpellLocal
"  hi SpellBad    ctermfg=9
"  hi SpellCap    ctermfg=3    cterm=underline
"  hi SpellRare   ctermfg=13   cterm=underline
"  hi SpellLocal  cterm=None
"endif 
"}}}

" navigation {{{
  inoremap jj <ESC>
  inoremap kk <ESC>
  set wildmenu
  nnoremap k gk
  nnoremap j gj
  " }}}

" window stuff {{{
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  "map <C-S-h> <C-w>< " does not user shift yet, because vim does not
  "map <C-S-j> <C-w>+ "
  "map <C-S-k> <C-w>- "
  "map <C-S-l> <C-w>> "
  "" }}}
 
" "Tabularize Shortcuts
  let mapleader=','
  "if exists(":Tabularize")
  "  nmap <Leader>a= :Tabularize /=<CR>
  "  vmap <Leader>a= :Tabularize /=<CR>
  "  nmap <Leader>a: :Tabularize /:\zs<CR>
  "  vmap <Leader>a: :Tabularize /:\zs<CR>
  "  nmap <Leader>a| :Tabularize /|<CR>
  "  vmap <Leader>a| :Tabularize /|<CR>
  "endif

" easier search
  nnoremap / /\v
  vnoremap / /\v "normale rexen
  set hlsearch
  set ignorecase
  set smartcase
  set incsearch

" toggle wrapping with F10
  " TODO: find out how ugly this really is
  function! WrapToggle()
    if g:wrapped
      let g:wrapped = 0
      set textwidth=0
    else
      let g:wrapped = 1
      set textwidth=80
    endif
  endfunction
  let g:wrapped = 0
  map <F10> :call WrapToggle()<CR>
  imap <F10> :call WrapToggle()<CR>

  map <F3> :nohl<CR>
  noremap <silent><Leader>/ :nohls<CR>

  map <F4> :call Switch_h_cpp()<CR>
  map <F8> :make -j4 <CR>

" latex stuff
  filetype plugin on
  if has('gui_running')
    set grepprg=grep\ -nH\ $*
    filetype indent on
    let g:tex_flavor='latex'
  endif

