vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
  function()
    use 'wbthomason/packer.nvim'
    use 'altercation/vim-colors-solarized'
    use 'tpope/vim-commentary'
    use 'nanotee/zoxide.vim'
-- telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'jvgrootveld/telescope-zoxide'
  end
)


