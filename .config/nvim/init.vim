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

" directory structure (ctrl+n to activate)
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ryanoasis/vim-devicons'
"Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " does not work with Neovim 0.8

" tabline
Plug 'nanozuki/tabby.nvim', { 'branch': 'main' }

" autocomplete
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'jiangmiao/auto-pairs' " auto-insert close brackets, braces, etc.
Plug 'tpope/vim-commentary' " comment-out by shortcut 'gc'

" linting
Plug 'dense-analysis/ale'
Plug 'vim-python/python-syntax'
Plug 'nvie/vim-flake8' " syntax+style checker for python
Plug 'Vimjas/vim-python-pep8-indent' " indentation for python
Plug 'tmhedberg/SimpylFold' " python code folding

" syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'OrangeT/vim-csharp'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" python (non-linting)
Plug 'jmcantrell/vim-virtualenv' " venv support for python
Plug 'tweekmonster/impsort.vim' " color and sort imports

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
set formatoptions-=t
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set fileformats=unix
set encoding=utf-8
set clipboard+=unnamedplus
set viminfo='20,<1000" " allow copying of more than 50 lines to other applications
set mouse=a " enable scrolling with mouse wheel

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0
set wrap
set linebreak
set nolist  " list disables linebreak
set guitablabel=%N/\ %t\ %M
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

" python settings
au BufNewFile,BufRead,BufEnter *.py
    \  set tabstop=4
    \| set softtabstop=4
    \| set shiftwidth=4
    \| set textwidth=79
    \| set expandtab
    \| set autoindent
    \| set fileformat=unix

highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" easy breakpoint python
au FileType python map <silent> <leader>b ofrom pudb import set_trace; set_trace()<Esc>
au FileType python map <silent> <leader>B Ofrom pudb import set_trace; set_trace()<Esc>
au FileType python map <silent> <leader>j ofrom pdb import set_trace; set_trace()<Esc>
au FileType python map <silent> <leader>J Ofrom pdb import set_trace; set_trace()<Esc>

" highlight python and self function
autocmd BufEnter * syntax match Type /\v\.[a-zA-Z0-9_]+\ze(\[|\s|$|,|\]|\)|\.|:)/hs=s+1
autocmd BufEnter * syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
hi def link pythonFunction Function
autocmd BufEnter * syn match Self "\(\W\|^\)\@<=self\(\.\)\@="
highlight self ctermfg=239

" move between defs python:
" NOTE: this breaks shortcuts with []
nnoremap [[ [m
nnoremap ]] ]m

nnoremap <silent><nowait> [ [[
nnoremap <silent><nowait> ] ]]

function! MakeBracketMaps()
    nnoremap <silent><nowait><buffer> [ :<c-u>exe 'normal '.v:count.'[m'<cr>
    nnoremap <silent><nowait><buffer> ] :<c-u>exe 'normal '.v:count.']m'<cr>
endfunction

augroup bracketmaps
    autocmd!
    autocmd FileType python call MakeBracketMaps()
augroup END

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    with open(activate_this) as f:
        code = compile(f.read(), activate_this, 'exec')
        exec(code, dict(__file__=activate_this))
EOF

" javascript/typescript settings
" rescan entire buffer when highlighting to fix syntax highlighting desyncing
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

au BufNewFile,BufRead,BufEnter *.html,*.css,*.js,*.jsx,*.ts,*.tsx
    \  set tabstop=2
    \| set softtabstop=2
    \| set shiftwidth=2

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

" Coc
" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" impsort
hi pythonImportedObject ctermfg=127
hi pythonImportedFuncDef ctermfg=127
hi pythonImportedClassDef ctermfg=127

" ALE
let g:ale_list_window_size = 4
let g:ale_sign_column_always = 0
let g:ale_open_list = 1
let g:ale_keep_list_window_open = '1'

" Options are in .pylintrc!
highlight VertSplit ctermbg=253

let g:ale_sign_error = '!!'
let g:ale_sign_warning = '•'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = '0'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = '1'
let g:ale_fix_on_save = 1
nmap <silent> <C-M> <Plug>(ale_previous_wrap)
nmap <silent> <C-m> <Plug>(ale_next_wrap)

" vimgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0

" NERDTree bindings and settings
map <C-n> <plug>NERDTreeTabsToggle<CR>
let NERDTreeShowHidden=1 " Show hidden files in NerdTree buffer.
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Hide .pyc files
let NERDTreeIgnore=['\.pyc$', '^__pycache__$', '\~$']
let g:nerdtree_tabs_open_on_gui_startup = 2
let g:nerdtree_tabs_open_on_console_startup = 2

" tagbar
map <C-t> :set nosplitright<CR>:TagbarToggle<CR>:set splitright<CR>
