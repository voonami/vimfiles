" Simple Voonami .vimrc file
" vim:set ts=2 sts=2 sw=2 expandtab:

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

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
" Turn on mouse because with integrated clipboard this is nice again.
set mouse=a
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
" remove search highlight
nnoremap <leader><CR> :nohlsearch<CR>
" delete current line - changed to c-x because c-d is a system mapping.
nnoremap <c-x> dd
inoremap <c-x> <esc>ddi
inoremap <c-X> <esc>cc

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
nnoremap <leader>m <c-^>

" Use system clipboard
set clipboard=unnamed

" CTRL+Space does auto complete
inoremap <Nul> <C-n>

" Apply the . command to all selected lines in visual mode
vnoremap <Leader>. :normal.<cr>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Insert a javascript function
imap <c-j> function()<space>{}<esc>i

" Convert and line to a block start
imap <c-d> <end><space>do<cr>

" Open the editor in its own left split
map <leader>e :Vexplore<cr>

" Open rails routes in a split window
map <leader>gr :topleft :split config/routes.rb<cr>
" Open the Gemfile in a split window
map <leader>gg :topleft 100 :split Gemfile<cr>

" Command-T Key Bindings
let g:CommandTCancelMap=['<ESC>','<C-c>']
let g:CommandTAcceptSelectionSplitMap=['<C-CR>','<C-s>']
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>ga :CommandTFlush<cr>\|:CommandT app/assets<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT app/presenters<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandTTag<cr>
map <leader>t :CommandTFlush<cr>\|:CommandT<cr>
map <leader>T :CommandTFlush<cr>\|:CommandT %%<cr>

" Mapping for unobtrusive editing (IE: save without removing whitespace)
map <Leader>w :noautocmd w<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> :echo "IMPOSSIBRU!!"<cr>
map <Right> :echo "IMPOSSIBRU!!"<cr>
map <Up> :echo "IMPOSSIBRU!!"<cr>
map <Down> :echo "IMPOSSIBRU!!"<cr>

" File types to hide in the file browser
let g:netrw_list_hide= '.*\.swp$'

" Javascript autocmd's
augroup filetype_js
	autocmd!
	autocmd FileType javascript setlocal number
	" Comment line of code
	autocmd FileType javascript nnoremap <buffer> <localleader>c 0i//<esc>
	" autocmd BufWrite,BufRead *.js :normal gg=G
  " remove traling whitespace
  autocmd BufWritePre *.js :%s/\s\+$//e
augroup END

augroup filetype_php
  autocmd!
  autocmd FileType php setlocal number
  " Comment line of code
  autocmd FileType php nnoremap <buffer> <localleader>c 0i//<esc>
augroup END

" Ruby autocmd's
augroup filetype_ruby
	autocmd!
	autocmd FileType ruby setlocal number

	" Comment line of code
	autocmd FileType ruby nnoremap <buffer> <localleader>c 0i#<esc>

	" reformat entire file on read/write
  " autocmd BufWrite,BufRead *.rb :normal gg=G
	
  " remove traling whitespace
  autocmd BufWritePre *.rb :%s/\s\+$//e
augroup END

augroup filetype_html
	autocmd!
	" autocmd BufWrite,BufRead *.html :normal gg=G
	" autocmd BufWrite,BufRead *.haml :normal gg=G
augroup END

augroup filetype_jade
	autocmd!
	autocmd FileType jade setlocal number
augroup END

augroup filetype_haml
	autocmd!
	autocmd FileType haml setlocal number
augroup END

" Expand %% to current dir
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Statusline
" [RO] full file name modified
set statusline=%R%F\ %m
" right align everything else
set statusline+=%=
" Show current branch
set statusline+=%{fugitive#statusline()}
" [Column:line:Total Lines]
set statusline+=\[%c\:%l\/%L\]
" Percentage complete
set statusline+=\ \ %P

" The following is taken from  https://www.destroyallsoftware.com/file-navigation-in-vim.html
set winwidth=88
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
