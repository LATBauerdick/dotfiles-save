vim.cmd [[packadd packer.nvim]]

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
  end
)


