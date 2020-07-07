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
" fzf goodness
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" theme
Plug 'drewtempelmeyer/palenight.vim'

" powerline but better
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'tpope/vim-fugitive' " airline git integration
Plug 'airblade/vim-gitgutter' " displays git changes in file

" directory structure (ctrl+n to activate)
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" autocomplete
Plug 'OmniSharp/omnisharp-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-dispatch' " async build dispatcher, for omnisharp startup
Plug 'ervandew/supertab' " perform all vim insert mode completions with Tab
Plug 'jiangmiao/auto-pairs' " auto-insert close brackets, braces, etc.

" linting
Plug 'dense-analysis/ale'
Plug 'vim-python/python-syntax'
Plug 'nvie/vim-flake8' " syntax+style checker for python
Plug 'vim-scripts/indentpython.vim' " indentation for python
Plug 'tmhedberg/SimpylFold' " python code folding

" syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'OrangeT/vim-csharp'

" python (non-linting)
Plug 'jmcantrell/vim-virtualenv' " venv support for python

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

set clipboard+=unnamedplus
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

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" more natural split opening
set splitbelow
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" <Ctrl-l> redraws the screen and removes and search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>

" eliminate delay on esc
set timeoutlen=1000 ttimeoutlen=0

" neovim python providers
if !empty(glob("$PYENV_ROOT/versions/py2nvim/bin/python"))
    let g:python_host_prog = '$PYENV_ROOT/versions/py2nvim/bin/python'
endif
if !empty(glob("$PYENV_ROOT/versions/py3nvim/bin/python3"))
    let g:python3_host_prog = '$PYENV_ROOT/versions/py3nvim/bin/python3'
endif

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

au BufNewFile,BufRead *.html,*.css
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

" ===== PLUGIN SETTINGS =====

" theme
:silent! colorscheme palenight
let g:palenight_terminal_italics=1
let g:airline_theme='bubblegum'

let python_highlight_all=1

" OmniSharp
let g:OmniSharp_server_stdio = 1
"let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_timeout = 1 " TImeout in seconds to wait for a response from the server
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_highlighting = 2
set noshowmatch " showmatch significantly slows down omnicomplete when the first match contains parentheses
" don't autoselect first item in omnicomplete, show if only one item (for preview)
set completeopt=longest,menuone,preview
set updatetime=1000 " this setting controls how long to wait (in ms) before fetching type/symbol information
"set cmdheight=2 " Remove 'Press Enter to continue' message when type information is longer than one line
augroup omnisharp_commands
    autocmd!

    " Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
    autocmd FileType cs setlocal omnifunc=OmniSharp#Complete

    " Automatically add new cs files to the nearest project on save
    "autocmd BufWritePost *.cs call OmniSharp#AddToProject()

    " show type information automatically when the cursor stops moving
    "autocmd CursorHold *.cs call OmniSharp#actions#documentation#TypeLookup()

    " The following commands are contextual, based on the current cursor position.

    autocmd FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
    autocmd FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
    "autocmd FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
    autocmd FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
    autocmd FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
    " finds members in the current buffer
    autocmd FileType cs nnoremap <leader>fm :OmniSharpFindMembers<cr>
    " cursor can be anywhere on the line containing an issue
    "autocmd FileType cs nnoremap <leader>x :OmniSharpFixIssue<cr>
    autocmd FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
    autocmd FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
    autocmd FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
    " navigate up by method/property/field
    autocmd FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
    " navigate down by method/property/field
    autocmd FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

augroup END
" Contextual code actions
nnoremap <leader><space> :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader><space> :call OmniSharp#GetCodeActions('visual')<cr>
" rename with dialog
nnoremap <leader>nm :OmniSharpRename<cr>
nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename rename'
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
"nnoremap <leader>tp :OmniSharpAddToProject<cr>
" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>
" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
" Don't ask to save when changing buffers (i.e. when jumping to a type definition)
set hidden

" coc
let g:coc_global_extensions=[ 'coc-omnisharp' ]

" supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

" ALE
let g:ale_linters = { 'cs': ['OmniSharp'] }

" NERDTree bindings and settings
map <C-n> :NERDTreeToggle %<CR>
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
