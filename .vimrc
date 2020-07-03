set t_Co=256
set background=dark
set t_ut=""
set term=screen-256color
if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

syntax on
filetype plugin indent on

set clipboard=unnamed,unnamedplus
set number relativenumber
set noeb vb t_vb=
set formatoptions-=t
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set fileformats=unix

set tabstop=4
set softtabstop=0 expandtab
set shiftwidth=4
set textwidth=0
set wrap
set linebreak
set nolist  " list disables linebreak
set autoindent

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" eliminate delay on esc
set timeoutlen=1000 ttimeoutlen=0
