vim.cmd [[packadd packer.nvim]]



local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
-- vim-plug {{{
Plug 'jgdavey/tslime.vim'
Plug ('Shougo/vimproc.vim', {['do'] = 'make'})
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
-- Plug 'ervandew/supertab'
Plug 'benekastah/neomake'
Plug 'moll/vim-bbye'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/gitignore'

Plug ('mg979/vim-visual-multi', {branch = 'master'})
--
--
-- fzf fuzzy file search
--Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
--    Plug ('junegunn/fzf', { ['do'] = '{ -> fzf#install() }' })
--Plug 'BurntSushi/ripgrep
-- support for neuron
-- Plug 'fiatjaf/neuron.vim'
-- Plug 'chiefnoah/neuron-v2.vim'
--  Plug 'alok/notational-fzf-vim'
--  let g:nv_search_paths = ['~/Notes', '~/writing']
--
-- grepper
Plug 'mhinz/vim-grepper'
--
-- Git
-- Plug 'int3/vim-extradite'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

-- Bars, panels, and files
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
-- Plug 'itchyny/lightline.vim'
-- Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

-- Text manipulation
Plug 'vim-scripts/Align'
Plug 'simnalamburt/vim-mundo'
-- Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'michaeljsmith/vim-indent-object'
Plug 'easymotion/vim-easymotion'

-- vim sugar for shell commands
Plug 'tpope/vim-eunuch'

-- Allow pane movement to jump out of vim into tmux
Plug 'christoomey/vim-tmux-navigator'

Plug 'sbdchd/neoformat'

-- Plug 'vim-syntastic/syntastic'
-- Plug 'neoclide/coc.nvim', {'branch': 'release'}
-- Plug 'dense-analysis/ale'
Plug 'neovim/nvim-lspconfig'

-- Haskell

-- Plug 'neovimhaskell/haskell-vim'

Plug 'enomsg/vim-haskellConcealPlus'
-- for haskellConcealPlus disable double-stroke capitals (does not work on iPad)
-- let hscoptions="𝐌𝐄𝐓𝐒iBQZDC*"

Plug 'Twinside/vim-hoogle'

-- PureScript
Plug 'raichoo/purescript-vim'
--Plug 'frigoeu/psc-ide-vim'

-- rust
Plug 'rust-lang/rust.vim'

Plug 'ledger/vim-ledger'

-- Custom bundles
Plug 'terryma/vim-smooth-scroll'
Plug 'sdothum/vim-colors-duochrome'
Plug 'rakr/vim-one'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'mvandiemen/ghostbuster'

Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'

-- }}}
vim.call('plug#end')

return require('packer').startup(
  function()
    use 'hrsh7th/nvim-compe'
    use 'wbthomason/packer.nvim'
    use 'altercation/vim-colors-solarized'
    use 'shaunsingh/nord.nvim'
    use 'tpope/vim-commentary'
    use 'nanotee/zoxide.vim'
-- telescope
    use {
        'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'jvgrootveld/telescope-zoxide'
    use 'sudormrfbin/cheatsheet.nvim'
    use { "oberblastmeister/neuron.nvim", branch = 'unstable' }

    use 'nvim-treesitter/nvim-treesitter' --  We recommend updating the parsers on update
    use 'neovim/nvim-lspconfig'
  end
)


