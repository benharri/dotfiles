filetype plugin indent on

syntax enable

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

set nrformats-=octal

set incsearch

set number
set numberwidth=4
set updatetime=100
set laststatus=2
set ruler
set wildmenu

set display+=lastline

set encoding=utf-8

set autoread

set history=1000
set tabpagemax=50

noremap 0 ^
noremap ^ 0

inoremap <C-U> <C-G>u<C-U>

cmap w!! w !sudo tee % >/dev/null

set rtp+=~/.fzf

execute pathogen#infect()

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim:set ft=vim et sw=2:

