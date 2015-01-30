set nocompatible

" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Theme
let g:solarized_termcolors=256
colorscheme solarized
set background=dark
highlight Normal ctermbg=black

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" <Esc> is so far away
inoremap nn <Esc>

nnoremap <Leader>h :noh<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

if has('mouse')
  set mouse=a
endif

if &t_Co > 2 || has("gui_running")
  set hlsearch
endif

if has("autocmd")
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" :W sudo saves the file
" " (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Set utf8 as standard encoding
set encoding=utf8
" Use Unix as the standard file type
set ffs=unix,dos,mac
set endofline

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Tabs
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

set number
let mapleader = "\<Space>"

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
" Close NERDTree if it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Airline
set guifont=Source\ Code\ Pro\ Powerline\ 11
let g:airline_powerline_fonts = 1
