-- equilibriumuk neovim 0.5 nightly config
----
vim.g.mapleader = ','
local vim = vim
local o = vim.o
local bo = vim.bo
local wo = vim.wo
o.termguicolors = true
o.syntax = 'on'
o.errorbells = false
o.smartcase = true
o.showmode = false
bo.swapfile = false
o.backup = false
o.undodir = vim.fn.stdpath('config') .. '/undodir'
o.undofile = false
o.incsearch = true
o.hidden = true
o.completeopt = 'menuone,noinsert,noselect'
bo.autoindent = true
bo.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
wo.number = true
wo.signcolumn = 'yes'
wo.wrap = true
-- check plugin manager installed
if require('check_packer')() then
    return
end
-- load plugins
require 'plugins'
-- load plugins config
require 'plugins_conf'
-- set colorscheme
vim.cmd 'colorscheme nightfly'
-- load keybindings
require 'keybindings'
--
---- references / sources
---- rust lsp https://sharksforarms.dev/posts/neovim-rust/
