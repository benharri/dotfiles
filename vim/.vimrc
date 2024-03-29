" posix compatibility
if &shell =~# 'fish$'
    set shell=sh
endif

filetype plugin indent on

syntax enable

colo elflord
set guifont="JetBrains Mono"
set noerrorbells visualbell t_vb=
set mouse+=a

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

set ignorecase
set smartcase
set incsearch

set number
set relativenumber
set numberwidth=4
set updatetime=100
set laststatus=2
set ruler
set wildmenu
set showcmd

set display+=lastline

set encoding=utf-8

set autoread

set history=1000
set tabpagemax=50

noremap 0 ^
noremap ^ 0

nmap Q <Nop> " 'Q' in normal mode enters Ex mode. you almost never want this

" shortcuts for 3way merge
map <Leader>1 :diffget LOCAL<CR>
map <Leader>2 :diffget BASE<CR>
map <Leader>3 :diffget REMOTE<CR>

if has("patch-8.1.0360")
    set diffopt+=internal,algorithm:patience
end

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

inoremap <C-U> <C-G>u<C-U>

cmap w!! w !sudo tee % >/dev/null

set rtp+=~/.fzf

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim:set ft=vim et sw=2:

