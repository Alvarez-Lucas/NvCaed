-- api shorteners
local fn = vim.fn
local vc = vim.cmd

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  use("wbthomason/packer.nvim") -- Packer can manage itself

  -- Colorschemes
  use {
      "phha/zenburn.nvim",
      config = function() require("zenburn").setup() end,
      disable = true
  }
  use {"jacoborus/tender.vim", event = "BufWinEnter", config = "vc('colorscheme tender')"}

  -- Vimwiki
  use{"vimwiki/vimwiki", cmd = {"VimwikiIndex", "cd $HOME/vimwiki"}}

  -- Telescope
  use{"nvim-telescope/telescope.nvim", requires = {{'nvim-lua/plenary.nvim'}}, cmd = "Telescope", config = function() require('caed.telescope-config') end}

  -- NvimTree
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require('caed.nvim-tree-config') end,
    -- cmd = "NvimTreeToggle",
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- LSP?

  -- END
  if packer_bootstrap then
    require('packer').sync()
  end
end)
