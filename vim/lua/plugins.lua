vim.cmd [[packadd packer.nvim]]

-- paq plugin manager https://github.com/savq/paq-nvim/
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end

require "paq" {
    "savq/paq-nvim";                  -- Let Paq manage itself
-- paq-nvim {{{
    -- {"lervag/vimtex", opt=true};      -- Use braces when passing options
    'jgdavey/tslime.vim';
    {'Shougo/vimproc.vim', ['do'] = 'make'};
    'wellle/targets.vim';
    'scrooloose/nerdcommenter';
    'jiangmiao/auto-pairs';
-- Plug 'ervandew/supertab'
    'benekastah/neomake';
    'moll/vim-bbye';
    'nathanaelkane/vim-indent-guides';
    'vim-scripts/gitignore';

    { 'mg979/vim-visual-multi', branch = 'master' };
--
-- fzf fuzzy file search
--  Plug '/usr/local/opt/fzf'
    'junegunn/fzf.vim';
--    Plug ('junegunn/fzf', { ['do'] = '{ -> fzf#install() }' })
--Plug 'BurntSushi/ripgrep
-- support for neuron
-- Plug 'fiatjaf/neuron.vim'
-- Plug 'chiefnoah/neuron-v2.vim'
--  Plug 'alok/notational-fzf-vim'
--  let g:nv_search_paths = ['~/Notes', '~/writing']
--
-- grepper
    'mhinz/vim-grepper';
--
-- Git
-- Plug 'int3/vim-extradite'
    'mhinz/vim-signify';
    'tpope/vim-fugitive';
    'tpope/vim-rhubarb';
    'junegunn/gv.vim';

-- Bars, panels, and files
    'scrooloose/nerdtree';
    'bling/vim-airline';
-- Plug 'itchyny/lightline.vim'
-- Plug 'ctrlpvim/ctrlp.vim'
    'majutsushi/tagbar';

-- Text manipulation
    'vim-scripts/Align';
    'simnalamburt/vim-mundo';
    'tpope/vim-commentary';
    'tpope/vim-surround';
    'godlygeek/tabular';
    'michaeljsmith/vim-indent-object';
    'easymotion/vim-easymotion';

-- vim sugar for shell commands
    'tpope/vim-eunuch';

-- Allow pane movement to jump out of vim into tmux
    'christoomey/vim-tmux-navigator';

    'sbdchd/neoformat';

-- Plug 'vim-syntastic/syntastic'
-- Plug 'neoclide/coc.nvim', {'branch': 'release'}
-- Plug 'dense-analysis/ale'
    'neovim/nvim-lspconfig';

-- Haskell

    {'ndmitchell/ghcid', ['rtp'] = 'plugins/nvim' };
--  'neovimhaskell/haskell-vim';

    'enomsg/vim-haskellConcealPlus';
-- for haskellConcealPlus disable double-stroke capitals (does not work on iPad)

    'Twinside/vim-hoogle';

-- PureScript
    'raichoo/purescript-vim';
--Plug 'frigoeu/psc-ide-vim'

-- rust
    'rust-lang/rust.vim';
-- ledger
    'ledger/vim-ledger';

-- Custom bundles
    'terryma/vim-smooth-scroll';
    'sdothum/vim-colors-duochrome';
    'rakr/vim-one';
    'tpope/vim-vinegar';
    'tpope/vim-fireplace';
    'tpope/vim-unimpaired';
    'tpope/vim-sexp-mappings-for-regular-people';
    'guns/vim-sexp';
    'tpope/vim-repeat';
    'tpope/vim-surround';
    'vim-airline/vim-airline-themes';
    'mvandiemen/ghostbuster';

    'tpope/vim-dispatch';
    'radenling/vim-dispatch-neovim';

    'altercation/vim-colors-solarized';
    'shaunsingh/nord.nvim';
    'nanotee/zoxide.vim';
-- }}}
}

vim.cmd [[
let hscoptions="𝐌𝐄𝐓𝐒iBQZDC*"
]]

-- alternative vim-plug version
-- vim.cmd [[ if empty(glob('~/.config/nvim/autoload/plug.vim'))
--   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
--     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
--   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
-- endif
-- ]]
-- local Plug = vim.fn['plug#']
-- vim.call('plug#begin', '~/.config/nvim/plugged')
--  Plug 'tpope/vim-dispatch'
--  Plug ('mg979/vim-visual-multi', {branch = 'master'})
-- vim.call('plug#end')

return require('packer').startup(
  function()
    use 'hrsh7th/nvim-compe'
    use 'wbthomason/packer.nvim'
-- telescope
    use {
        'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'jvgrootveld/telescope-zoxide'
    use 'sudormrfbin/cheatsheet.nvim'
    use 'oberblastmeister/neuron.nvim'
    use 'nvim-lua/popup.nvim'

    use 'nvim-treesitter/nvim-treesitter' --  We recommend updating the parsers on update
    use 'neovim/nvim-lspconfig'
  end
)


