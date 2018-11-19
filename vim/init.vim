" Type :so % to refresh .vimrc after making changes

" -- pathogen plugin manager
" set nocompatible
" execute pathogen#infect()
" execute pathogen#helptags()

" vim-plug {{{

set nocompatible

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

if has('nvim')
  call plug#begin('~/.config/nvim/bundle')
else
  call plug#begin('~/.vim/bundle')
endif

" Support bundles
Plug 'jgdavey/tslime.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'ervandew/supertab'
Plug 'benekastah/neomake'
Plug 'moll/vim-bbye'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/gitignore'

" Git
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'

" Bars, panels, and files
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

" Text manipulation
Plug 'vim-scripts/Align'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'michaeljsmith/vim-indent-object'
Plug 'easymotion/vim-easymotion'

" Allow pane movement to jump out of vim into tmux
Plug 'christoomey/vim-tmux-navigator'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }
Plug 'parsonsmatt/intero-neovim', { 'for': 'haskell' }

" PureScript
Plug 'raichoo/purescript-vim'
"""""""Plug 'frigoeu/psc-ide-vim'

" Custom bundles
Plug 'altercation/vim-colors-solarized'
"Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'rakr/vim-one'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'mvandiemen/ghostbuster'

call plug#end()

" }}}


let mapleader = ","
" Allow the normal use of "," by pressing it twice
" noremap ,, ,
let maplocalleader = "\\"

" Use par for prettier line formatting
set formatprg=par
let $PARINIT = 'rTbgqR B=.,?_A_a Q=_s>|'

" Show trailing whitespace
set list
" But only interesting whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
" set listchars=tab:▸\ ,eol:¬

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" syntastic beginners settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = "elixir"

" set system clipboard to be default
set clipboard=unnamed
" VSplit window
nnoremap <leader>s <C-w>v<C-w>l
nnoremap <leader>2 :vsplit<CR>
nnoremap <leader>1 :only<CR>
" go to the other window
nnoremap <leader>w <C-w><C-w>
nnoremap <leader>o <C-w><C-w>

noremap ; :
" remap Esc key
" Can be typed even faster than jj, and if you are already in
"    normal mode, you (usually) don't accidentally move:
:imap jk <Esc>
:imap kj <Esc>

" strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Ack command
nnoremap <leader>a :Ack
let g:ackprg = 'ag --vimgrep'

" quickly edit .vimrc file
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" -- vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#right_alt_sep = '|'
" let g:airline_left_sep = ' '
" let g:airline_left_alt_sep = '|'
" let g:airline_right_sep = ' '
" let g:airline_right_alt_sep = '|'

" easy expansion of the Active File Directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" -- solarized color scheme
colorscheme solarized
"let g:solarized_termcolors=256
"let g:solarized_termcolors = 16
"let g:solarized_termtrans = 1
"let g:solarized_visibility = "high"
"let g:solarized_contrast = "high"
"set termguicolors
set background=light
"set background=dark
let g:one_allow_italics = 1 " I love italic for comments
"let g:airline_theme='base16_solarized'
"colorscheme xcode
"colorscheme ghostbuster
"colorscheme one
"let g:airline_theme='one'

" for haskellConcealPlus disable double-stroke capitals (does not work on iPad)
let hscoptions="𝐌𝐄𝐓𝐒iBQZDC"

set showcmd       " display incomplete command
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

" close buffer without closing window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

"Set default font in mac vim and gvim
" set guifont=Hack:h14
set linespace=4
set cursorline    " highlight the current line
set visualbell    " stop that ANNOYING beeping

" Allow usage of mouse in iTerm
set ttyfast
set mouse=a

set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
set incsearch
set showmatch
" Disable highlight when <leader><cr> is pressed
" but preserve cursor coloring
nmap <silent> <leader><cr> :noh\|hi Cursor guibg=red<cr>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1
set linebreak

" define Wrap command to set text soft wrapping
command! -nargs=* Wrap set wrap linebreak nolist

" Numbers
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
" set splitbelow
set splitright

" Auto resize Vim splits to active split
" set winwidth=104
" set winheight=5
" set winminheight=5
" set winheight=999

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Always use vertical diffs
set diffopt+=vertical

" NERDtree
map <C-n> :NERDTreeToggle<CR>

" Fuzzy find files
nnoremap <silent> <Leader><space> :CtrlP<CR>
let g:ctrlp_max_files=0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git|.cabal-sandbox|.stack-work)$' }

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>


syntax on

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Ag will search from project root
let g:ag_working_path_mode="r"

" Quickly close windows
nnoremap <leader>x :x<cr>
nnoremap <leader>X :q!<cr>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>_ :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>


" resize panes
" nnoremap <silent> <Right> :vertical resize +5<cr>
" nnoremap <silent> <Left> :vertical resize -5<cr>
" nnoremap <silent> <Up> :resize +5<cr>
" nnoremap <silent> <Down> :resize -5<cr>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" use cursor keys to move display lines
nmap <up> gk
nmap <down> gj
inoremap <Up> <C-o>gk
inoremap <Down> <C-o>gj
nnoremap <Up> gk
nnoremap <Down> gj

" AUTOCOMMANDS - Do stuff

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"update dir to current file
autocmd BufEnter * silent! cd %:p:h

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

"augroup END

set foldmethod=marker

let g:purescript_indent_if = 3
let g:purescript_indent_case = 5
let g:purescript_indent_let = 4
let g:purescript_indent_where = 6
let g:purescript_indent_do = 3

let g:psc_ide_syntastic_mode = 1
au FileType purescript nmap <leader>t :PSCIDEtype<CR>
au FileType purescript nmap <leader>s :PSCIDEapplySuggestion<CR>
au FileType purescript nmap <leader>a :PSCIDEaddTypeAnnotation<CR>
au FileType purescript nmap <leader>i :PSCIDEimportIdentifier<CR>
au FileType purescript nmap <leader>r :PSCIDEload<CR>
au FileType purescript nmap <leader>p :PSCIDEpursuit<CR>
au FileType purescript nmap <leader>c :PSCIDEcaseSplit<CR>
au FileType purescript nmap <leader>qd :PSCIDEremoveImportQualifications<CR>
au FileType purescript nmap <leader>qa :PSCIDEaddImportQualifications<CR>