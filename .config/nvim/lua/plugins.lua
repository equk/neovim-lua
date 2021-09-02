-- init plugin manager
return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'
    -- load plugins
    use 'airblade/vim-gitgutter'
    use 'anott03/nvim-lspinstall'
    use 'honza/vim-snippets'
    use 'itchyny/lightline.vim'
    use 'itchyny/vim-gitbranch'
    use 'jiangmiao/auto-pairs'
    use 'jremmen/vim-ripgrep'
    ---- telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
      }
    }
    ---- completion
    use {
      'nvim-lua/completion-nvim',
      requires = {
        'neovim/nvim-lspconfig',
        'steelsojka/completion-buffers'
      }
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'sirver/ultisnips'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'bluz71/vim-nightfly-guicolors'
    use 'lukas-reineke/indent-blankline.nvim'
end)
