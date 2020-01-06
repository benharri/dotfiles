" posix compatibility
if &shell =~# 'fish$'
    set shell=sh
endif

filetype plugin indent on

syntax enable

colo ron
set guifont="Input"

set spell
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

" swap settings
set swapfile
set directory^=~/.vim/swap//
set writebackup
set nobackup
set backupcopy=auto
" patch required to honor double slash
if has("patch-8.1.0251")
    " consolidate writebackups
    set backupdir^=~/.vim/backup//
end
set undofile
set undodir=~/.vim/undodir

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

" shortcuts for 3way merge
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>

if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
end

inoremap <C-U> <C-G>u<C-U>

cmap w!! w !sudo tee % >/dev/null

set rtp+=~/.fzf

execute pathogen#infect()

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim:set ft=vim et sw=2:

