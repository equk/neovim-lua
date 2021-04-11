-- equilibriumuk neovim 0.5 nightly config
----
vim.g.mapleader = ','
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
o.undofile = true
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
local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
-- check plugin manager installed
if require('check_packer')() then
    return
end
-- load plugins
require 'plugins'
-- load plugins config
require 'plugins_conf'
-- set colorscheme
require('colorbuddy').colorscheme('gruvbuddy')
-- load keybindings
require 'keybindings'
--
---- references / sources
---- rust lsp https://sharksforarms.dev/posts/neovim-rust/