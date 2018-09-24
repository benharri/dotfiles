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

set laststatus=2
set ruler
set wildmenu

set display+=lastline

set encoding=utf-8

set autoread

set history=1000
set tabpagemax=50

inoremap <C-U> <C-G>u<C-U>

set rtp+=~/.fzf

" vim:set ft=vim et sw=2:

