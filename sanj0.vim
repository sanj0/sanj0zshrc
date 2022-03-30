set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'frazrepo/vim-rainbow'
Plugin 'sheerun/vim-polyglot'
Plugin 'preservim/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'sainnhe/sonokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'mhinz/vim-startify'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader=","
let g:rainbow_active = 1
let g:startify_session_persistence = 1
set background=dark
set path+=**
" ignore .class files in maven target for gf
set wildignore+=*/target/*
set wildmenu
set cursorline
colorscheme sonokai
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
set smartindent
set nu rnu
syntax on
set spelllang=en_us,de_de
set spell
set complete+=kspell
set ts=4 sw=4
set expandtab
set scrolloff=999

" show word count
set statusline+=%{wordcount().words}\ words


" some setting to make text editing way better
noremap j gj
noremap k gk

autocmd BufRead,BufNewFile *.md setlocal tw=80
autocmd BufRead,BufNewFile *.txt setlocal tw=80


set list
set listchars=tab:>-,trail:.

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
