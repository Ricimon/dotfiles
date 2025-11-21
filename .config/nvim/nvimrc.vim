" ===== PLUGINS =====

" auto-install vim-plug
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent execute '!curl -fLo ' . autoload_plug_path . ' --create-dirs
        \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path
call plug#begin()

"============= add all vim-plug plugins here ===============
" search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy search files

" theme
Plug 'drewtempelmeyer/palenight.vim'

" powerline but better
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" tagbar
Plug 'preservim/tagbar' " shows tags in a bar (functions etc) for easy browsing

" git
Plug 'tpope/vim-fugitive' " airline git integration
Plug 'airblade/vim-gitgutter' " displays git changes in file

" tabline
Plug 'nanozuki/tabby.nvim', { 'branch': 'main' }

" autocomplete
Plug 'tpope/vim-commentary' " comment-out by shortcut 'gc'

" misc
Plug 'tpope/vim-obsession' " save vim sessions
Plug 'jeffkreeftmeijer/vim-numbertoggle' " auto toggle between hybrid and absolute line numbers
Plug 'psliwka/vim-smoothie' " smooth scrolling

call plug#end()

" ===== vim settings =====

set t_Co=256
set background=dark
set t_ut=""
if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

syntax on
filetype plugin indent on

set number relativenumber " show line numbers
set smartcase " better case-sensitivity when searching
set wrapscan " begin search from top of file when nothing is found anymore
set noeb vb t_vb=
autocmd FileType * setlocal formatoptions-=t formatoptions-=c formatoptions-=r formatoptions-=o
set fileformats=unix
set encoding=utf-8
set clipboard+=unnamedplus
set viminfo='20,<1000" " allow copying of more than 50 lines to other applications
set mouse=a " enable scrolling with mouse wheel

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=-1
set textwidth=0
set wrap
set linebreak
set nolist  " list disables linebreak
set fillchars+=vert:\  " remove chars from separators
set breakindent " preserve horizontal whitespace when wrapping
set showbreak=..
set signcolumn=yes

" Enable folding
set foldmethod=indent
set foldlevel=99

set scrolloff=3 " keep 3 lines between the cursor and the edge of the screen

set hlsearch " highlight search and search while typing
set incsearch
set cpoptions+=x " stay at search item when <esc>

" more natural split opening
set splitbelow
set splitright

" suppress the annoying 'match x of y', 'The only match', and 'Pattern not found' messages
set shortmess+=c

set history=1000 " remember more commands and search history
set undodir=~/.vim/undodir
set undofile " save undos
set undolevels=10000 " maximum number of changes that can be undone
set undoreload=100000 " maximum number of lines to save for undo on a buffer reload

set laststatus=2 " always show statusline

" set leader
let mapleader = " " " Leader is the space key
let g:mapleader = " "
let maplocalleader = "`"
let g:maplocalleader = "`"
nnoremap <SPACE> <Nop>

nmap <leader>w :w!<cr>
nmap <leader>q :lcl<cr>:q<cr>
nnoremap <leader>h :nohlsearch<Bar>:echo<CR>

" toggle relative numbering
nnoremap <F4> :set relativenumber!<CR>

" switching between buffers
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>

" split windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" map S to replace current word with pasteboard
nnoremap S diw"0P
nnoremap cc "_cc

" mapping to make movements operate on 1 screen line in wrap mode
function! ScreenMovement(movement)
    if &wrap
        return "g" . a:movement
    else
        return a:movement
    endif
endfunction

onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

" Navigate quickfix list with ease
nnoremap <silent> [q: cprevious<CR>
nnoremap <silent> ]q: cnext<CR>

" Remove all trailing whitespace by pressing C-S
nnoremap <C-S> :let _s@=/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" mapping Esc
imap <F13> <Esc>
cnoremap <Esc> <C-c>
inoremap <c-c> <Esc>
" disable terminal ctrl-z
nnoremap <C-z> <Esc>

" <Esc><Esc> redraws the screen and removes and search highlighting
nnoremap <Esc><Esc> :noh<CR>

" eliminate delay on esc
set timeoutlen=1000 ttimeoutlen=0

" reload vimrc
nnoremap <leader>v :source $MYVIMRC<CR>

" neovim options
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <C-a> <Esc>
nnoremap <C-x> <Esc>

" ===== PLUGIN SETTINGS =====

" theme
:silent! colorscheme palenight
let g:palenight_terminal_italics=1
let g:airline_theme='bubblegum'

let python_highlight_all=1

" fzf
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
nnoremap <leader>p :Rg<CR>

" ctrl-p
let g:ctrlp_custom_ignore = '\v\.(npy|jpg|pyc|so|dll)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 0 " disable working directory searching

" vim-commentary
map <C-_> gcc

" vimgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0

" tagbar
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
