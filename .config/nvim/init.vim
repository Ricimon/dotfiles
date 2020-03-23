set t_Co=256
set background=dark
set t_ut=""
if (has("termguicolors"))
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

syntax on

set clipboard=unnamed
set number relativenumber
set noeb vb t_vb=
set formatoptions-=t
set formatoptions-=cro
set fileformats=unix

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set textwidth=0
set wrap
set linebreak
set nolist  " list disables linebreak

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

" <Ctrl-l> redraws the screen and removes and search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" eliminate delay on esc
set timeoutlen=1000 ttimeoutlen=0

filetype plugin indent on

" auto-install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter *
		\  PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()

"============= add all vim-plug plugins here ===============
" fzf goodness
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" theme
Plug 'drewtempelmeyer/palenight.vim'

" powerline but better
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive' " git integration

" directory structure (ctrl+n to activate)
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" autocomplete
Plug 'OmniSharp/omnisharp-vim'
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'ervandew/supertab' " perform all vim insert mode completions with Tab

" linting
Plug 'neomake/neomake'
Plug 'vim-python/python-syntax'
Plug 'nvie/vim-flake8' " syntax+style checker for python
Plug 'vim-scripts/indentpython.vim' " indentation for python
Plug 'tmhedberg/SimpylFold' " python code folding

" python (non-linting)
Plug 'jmcantrell/vim-virtualenv' " venv support for python

" auto toggle between hybrid and absolute line numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()

" theme
:silent! colorscheme palenight
let g:palenight_terminal_italics=1
let g:airline_theme='bubblegum'

let python_highlight_all=1

" deoplete
let g:python3_host_prog = $HOME."/.pyenv/versions/py3nvim/bin/python"
let g:deoplete#enable_at_startup = 1

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

au BufNewFile,BufRead *.py
	\  set tabstop=4
	\| set softtabstop=4
	\| set shiftwidth=4
	\| set textwidth=79
	\| set expandtab
	\| set autoindent
	\| set fileformat=unix
	\| set encoding=utf-8

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.js, *.html, *.css
	\  set tabstop=2
	\| set softtabstop=2
	\| set shiftwidth=2

" limit ALE to only use OmniSharp
let g:ale_linters = { 'cs': ['OmniSharp'] }

" NERDTree bindings and settings
map <C-n> :NERDTreeToggle<CR>
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
