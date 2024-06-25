--[[
    ____      ______  ____  _   _________    ________ __
   / __ )    / / __ \/ __ \/ | / / ____/ |  / /  _/ //_/
  / __  |_  / / / / / /_/ /  |/ / __/  | | / // // ,<
 / /_/ / /_/ / /_/ / _, _/ /|  / /___  | |/ // // /| |
/_____/\____/\____/_/ |_/_/ |_/_____/  |___/___/_/ |_|

This configuration runs on Neovim Nightly

It uses the wbthomason/packer.nvim package manager.

* the lua/plugins.lua file contains the code for the packer.nvim package manager
* the lua/defaults/ dir contains my basic neovim options.
* the lua/bjornevik/ dir contains all specialized setup with regards to plugins etc.

I use <space> as my leader key.
--]]
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup("plugins", {
  -- updating all plugins simultaneously causes
  -- `kex_exchange_identification: read connection reset by peer could not read from remote repository`
  -- limiting concurrency seems to fix it 🤷
  concurrency = 8,
  rocks = { enabled = false },
})
require "defaults"
require "bjornevik"
