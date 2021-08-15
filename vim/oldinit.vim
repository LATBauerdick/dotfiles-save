

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Use par for prettier line formatting
set formatprg=par
let $PARINIT = 'rTbgqR B=.,?_A_a Q=_s>|'


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"-----------syntastic---------------------------
" syntastic beginners settings
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_elixir_checker = 1
let g:syntastic_elixir_checkers = "elixir"

"--------------------Ack command------------
nnoremap <leader>a :Ack
let g:ackprg = 'ag --vimgrep'
nnoremap <leader>g :Grepper<cr>
let g:grepper = { 'next_tool': '<leader>g' }
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

let g:ghcid_command= "/usr/local/bin/ghcid"

" redefine italics terminal codes so this works well in tmux
set t_ZH=[3m
set t_ZR=[23m

" fixes glitch? in colors when using vim with tmux
if !has('gui_running')
" set t_Co=256
" set notermguicolors
  " set background=light
  " colorscheme solarized
  " let g:solarized_termcolors=16
" comments are italicized
" let g:solarized_termtrans=1
" let g:solarized_contrast="high"
  " highlight Comment cterm=italic

else
" set termguicolors
  set background=light
  colorscheme solarized
  " colorscheme duochrome
endif
"
" This is only necessary if you use "set termguicolors".
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"------------- vim-airline----------------------
let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'
let g:airline_solarized_bg='light'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'

" easy expansion of the Active File Directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

"Set default font in mac vim and gvim
" set guifont=Hack:h14

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·,extends:>,precedes:<
",tab:»·,eol:¬,space:␣

" highlight non-ascii
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2

" define Wrap command to set text soft wrapping
command! -nargs=* Wrap set wrap linebreak nolist

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Always use vertical diffs
" set diffopt+=vertical

" NERDtree
map <C-n> :NERDTreeToggle<CR>

" Fuzzy find files
nnoremap <silent> <Leader><space> :<C-u>FZF<CR>
set rtp+=/usr/local/opt/fzf


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
vnoremap <silent> <up> gk
vnoremap <silent> <down> gj

" remap for smooth scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" define move keys for Colemak
" noremap h k
" noremap j h
" noremap k j

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

" persistent undofiles
set undofile
augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

" func! g:CustomNeuronIDGenerator(title)
"      return a:title
" " substitute(a:title, " ", "-", "g")
" endf

highlight Comment cterm=italic

