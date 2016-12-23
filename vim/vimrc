" Type :so % to refresh .vimrc after making changes
set nocompatible

" -- pathogen plugin manager
execute pathogen#infect()
execute pathogen#helptags()

let mapleader = ","
let maplocalleader = "\\"

" Shortcut to rapidly toggle `set list`
"nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" set termguicolors

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

" VSplit window
nnoremap <leader>s <C-w>v<C-w>l
nnoremap <leader>2 :vsplit<CR>
nnoremap <leader>1 :only<CR>
" go to the other window
nnoremap <leader>w <C-w><C-w>
nnoremap <leader>o <C-w><C-w>

noremap ; :

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
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'

" easy expansion of the Active File Directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" -- solarized color scheme
set background=light
colorscheme solarized

set showcmd       " display incomplete command
set autowrite     " Automatically :write before running commands
set autoread      " Reload files changed outside vim
" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !


"Set default font in mac vim and gvim
" set guifont=Hack:h14
set linespace=4
set cursorline    " highlight the current line
set visualbell    " stop that ANNOYING beeping
set mouse=a

set gdefault      " Never have to type /g at the end of search / replace again
set ignorecase    " case insensitive searching (unless specified)
set smartcase
set hlsearch
nnoremap <silent> <leader>, :noh<cr> " Stop highlight after searching
set incsearch
set showmatch

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
set winwidth=104
set winheight=5
set winminheight=5
set winheight=999

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

syntax on

" Load up all of our plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

filetype plugin indent on

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
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" Switch between the last two files
" nnoremap <leader><leader> <c-^>

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

augroup END
