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

set clipboard=unnamed
set number
set noeb vb t_vb=
set formatoptions-=t
set formatoptions-=cro

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" eliminate delay on esc
set timeoutlen=1000 ttimeoutlen=0

" auto-install Vundle
let freshVundleInstall=0
if empty(glob('~/.vim/bundle/Vundle.vim'))
	silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
	let freshVundleInstall=1
endif

set nocompatible		" required
filetype off			" required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

Plugin 'preservim/nerdtree'
Plugin 'OmniSharp/omnisharp-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dense-analysis/ale'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

if freshVundleInstall == 1
	:PluginInstall
	echo "Go to https://github.com/ycm-core/YouCompleteMe#installation for instructions on finishing the YCM vim-plugin install"
endif

" All of your Plugins must be added before the following line
call vundle#end()		" required
filetype plugin indent on	" required

" auto-install vim-plug
let freshVimPlugInstall=0
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	let freshVimPlugInstall=1
endif
call plug#begin()

" add all vim-plug plugins here
Plug '/home/linuxbrew/.linuxbrew/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'drewtempelmeyer/palenight.vim'

if freshVimPlugInstall == 1
	:PlugInstall --sync | source $MYVIMRC
endif

call plug#end()

colorscheme palenight
let g:palenight_terminal_italics=1

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |
	\ set encoding=utf-8

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au BufNewFile,BufRead *.js, *.html, *.css
	\ set tabstop=2
	\ set softtabstop=2
	\ set shiftwidth=2

" limit ALE to only use OmniSharp
let g:ale_linters = { 'cs': ['OmniSharp'] }
