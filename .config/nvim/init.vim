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

" tablin
Plug 'nanozuki/tabby.nvim', {'branch': 'main'}

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
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

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
set guitablabel=%N/\ %t\ %M

" Enable folding
set foldmethod=indent
set foldlevel=99

" more natural split opening
set splitbelow
set splitright

" set leader
let mapleader = ' '

" split windows
map <C-i> <C-W>i
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" <esc><esc> redraws the screen and removes and search highlighting
nnoremap <esc><esc> :noh<CR>

" eliminate delay on esc
set timeoutlen=1000 ttimeoutlen=0

" reload vimrc
nnoremap <leader>v :source $MYVIMRC<CR>

" neovim python providers
if !empty(glob("$PYENV_ROOT/versions/py2nvim/bin/python"))
    let g:python_host_prog = '$PYENV_ROOT/versions/py2nvim/bin/python'
endif
if !empty(glob("$PYENV_ROOT/versions/py3nvim/bin/python3"))
    let g:python3_host_prog = '$PYENV_ROOT/versions/py3nvim/bin/python3'
endif

au BufNewFile,BufRead,BufEnter *.py
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

" OmniSharp
let g:OmniSharp_server_stdio = 1
"let g:OmniSharp_server_type = 'roslyn'
let g:OmniSharp_timeout = 1 " TImeout in seconds to wait for a response from the server
let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_highlighting = 2
set noshowmatch " showmatch significantly slows down omnicomplete when the first match contains parentheses
" don't autoselect first item in omnicomplete, show if only one item (for preview)
set completeopt=longest,menuone,preview
set updatetime=300 " this setting controls how long to wait (in ms) before fetching type/symbol information
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
let g:coc_global_extensions = [
  \ 'coc-omnisharp',
  \ 'coc-tsserver'
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
    let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
    let g:coc_global_extensions += ['coc-eslint']
endif

" When hovering, show the diagnostic if it exists, otherwise the documentation
function! ShowDocIfNoDiagnostic(timer_id)
    if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
        silent call CocActionAsync('doHover')
    endif
endfunction

function! s:show_hover_doc()
    call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Open definition in a split window
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholderA call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a  <Plug>(coc-codeaction-selected)<CR>

" Remap keys for applying codeAction to the current buffer
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<cr>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<cr>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<cr>

" supertab
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

" ALE
let g:ale_linters = { 'cs': ['OmniSharp'] }

" NERDTree bindings and settings
map <C-n> :NERDTreeToggle %<CR>
let NERDTreeShowHidden=1 " Show hidden files in NerdTree buffer.
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
