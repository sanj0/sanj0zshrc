set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'godlygeek/tabular'
Plugin 'frazrepo/vim-rainbow'
Plugin 'sheerun/vim-polyglot'
Plugin 'preservim/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'sainnhe/sonokai'
Plugin 'vim-airline/vim-airline'
Plugin 'mhinz/vim-startify'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'rust-lang/rust.vim'
Plugin 'catppuccin/vim', { 'as': 'catppuccin' }
Plugin 'ajmwagar/vim-deus'
Plugin 'vim-scripts/scratch.vim'
call vundle#end()            " required

" say we edit something here

filetype plugin indent on    " required

" make java switch expression not break syntax highlighting
syn region  javaLabelRegion	transparent matchgroup=javaLabel start="\<case\>" matchgroup=NONE end=":" end="->" contains=javaNumber,javaCharacter,javaString

let mapleader=","
let g:rainbow_active = 0
let g:startify_session_persistence = 1
set background=dark
set path+=**
" ignore .class files in maven target for gf
set wildignore+=*/target/*
set wildmenu
set cursorline
colorscheme deus
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:startify_session_persistence=1
set smartindent
set nu rnu
syntax on
set spelllang=en_us,de_de
set spell
set complete+=kspell
set ts=4 sw=4
set expandtab
set scrolloff=999

" have a blinking bar in insert mode
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"

" remove ugly gray background from comments
hi Comment cterm=NONE
hi SpecialComment cterm=NONE

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand('~/.vim' . '/undodir')
    " Create dirs
    call system('mkdir -p' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Map key chord `jk` to <Esc>.
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
	if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
	if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
	let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
	return (l:timediff <= 0.05 && l:timediff >=0.001) ? "\b\e" : a:key
endfunction

inoremap <expr> j JKescape('j')
inoremap <expr> k JKescape('k')
" show word count
set statusline+=%{wordcount().words}\ words

noremap <Leader>s :Scratch<CR>
" ,l to print ls -lah and jmp to the end of the line
noremap <Leader>l :r !ls -ah1<CR> $
" ,f to print ls -a1 and jmp to the end of the line
noremap <Leader>f :r !ls -a1<CR> $

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

set incsearch

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
