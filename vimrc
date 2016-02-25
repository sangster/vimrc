set nocompatible

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'bogado/file-line'
Plug 'bronson/vim-trailing-whitespace'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'chrisbra/unicode.vim'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'ck3g/vim-change-hash-syntax'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'jgdavey/vim-blockle'
Plug 'junegunn/fzf.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'lilydjwg/colorizer'
Plug 'mattn/emmet-vim'
Plug 'ngmy/vim-rubocop'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-ruby/vim-ruby'
call plug#end()


if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" Don't use Ex mode, use Q for formatting
map Q gq

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

" Line Numbers
set number
set relativenumber
autocmd FocusLost * :set number
autocmd FocusGained * :set relativenumber

let mapleader = "\<Space>"

" <Esc> is so far away
inoremap ii <Esc>
" Saving from insert mode
inoremap qw <Esc>:w<CR>a

" Remove highlights
nnoremap <Leader>n :noh<CR>
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set laststatus=2
set ruler
set showcmd
set wildmenu
set wildmode=longest,list,full
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set t_Co=16

" Window Splits
set splitbelow
set splitright

" NERDTree
map <Leader>h :NERDTreeToggle<CR>
" Close NERDTree if it's the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Tab Completion (SuperTab allows <tab> to work for both)
let g:UltiSnipsSnippetDir="~/.vim/snippets/"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:ycm_complete_in_comments = 0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Colours!
set t_Co=256
let g:solarized_termcolors=256
syntax on
colorscheme solarized
set background=dark
highlight Normal ctermbg=16 " black in solarized colors

" Change background colour beyond 80
highlight ColorColumn ctermbg=232
set colorcolumn=80
let &colorcolumn=join(range(81,999),",")

" Airline
set guifont=Source\ Code\ Pro\ Powerline\ 11
let g:airline_powerline_fonts = 1


set smartcase
