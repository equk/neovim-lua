-- check if packer is installed
-- prompt to install if not loaded
--
---- https://github.com/tjdevries/config_manager
------ first_load.lua
local download_packer = function()
  if vim.fn.input 'Download Packer? (y for yes)' ~= 'y' then
    return
  end

  local directory = string.format('%s/site/pack/packer/start/', vim.fn.stdpath 'data')

  vim.fn.mkdir(directory, 'p')

  local out = vim.fn.system(
    string.format('git clone %s %s', 'https://github.com/wbthomason/packer.nvim', directory .. '/packer.nvim')
  )

  print(out)
  print 'Downloading packer.nvim...'
  print "( You'll need to restart now )"
end

return function()
  if not pcall(require, 'packer') then
    download_packer()

    return true
  end

  return false
end
