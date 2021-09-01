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
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/telescope.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'sirver/ultisnips'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    -- use 'joshdick/onedark.vim'
    -- use 'tjdevries/colorbuddy.nvim'
    -- use 'tjdevries/gruvbuddy.nvim'
    -- use 'haishanh/night-owl.vim'
    use 'bluz71/vim-nightfly-guicolors'
    use 'lukas-reineke/indent-blankline.nvim'
end)
