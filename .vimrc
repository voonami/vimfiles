" Simple Voonami .vimrc file
" vim:set ts=2 sts=2 sw=2 expandtab:

call pathogen#runtime_append_all_bundles()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING STUFF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=1
set switchbuf=useopen
" Add tab name to top of window
set showtabline=2
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
" set t_ti= t_te=
set scrolloff=3
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu

filetype on
let mapleader=","
let maplocalleader="\\"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" move current line down one line
nnoremap - ddp
" move current line up one line
nnoremap _ ddkP
" delete current line
nnoremap <c-d> dd
inoremap <c-d> <esc>ddi

" upcase current word in insert mode
inoremap <c-u> <esc>viwUi

" split screen and edit ~/.vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" double quote current word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" move cursor to beginning of the line in normal mode
nnoremap H ^

" move cursor to end of line in normal mode
nnoremap L $

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Change to previous buffer
nnoremap <leader><leader> <c-^>

" Use system clipboard
set clipboard=unnamed

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <nop>
map <Right> <nop>
map <Up> <nop>
map <Down> <nop>

" Javascript autocmd's
augroup filetype_js
	autocmd!
	autocmd FileType javascript setlocal number
	" Comment line of code
	autocmd FileType javascript nnoremap <buffer> <localleader>c I//
	autocmd BufWrite,BufRead *.js :normal gg=G
augroup END

" Ruby autocmd's
augroup filetype_ruby
	autocmd!
	autocmd FileType ruby setlocal number

	" Comment line of code
	autocmd FileType ruby nnoremap <buffer> <localleader>c I#

	" reformat entire file on read/write
  " autocmd BufWrite,BufRead *.rb :normal gg=G
	
augroup END

augroup filetype_html
	autocmd!
	autocmd BufWrite,BufRead *.html :normal gg=G
	autocmd BufWrite,BufRead *.haml :normal gg=G
augroup END


" Statusline
" [RO] full file name modified
set statusline=%R%F\ %m
" right align everything else
set statusline+=%=
" [Column:line:Total Lines]
set statusline+=\[%c\:%l\/%L\]
" Percentage complete
set statusline+=\ \ %P

