-- api shorteners
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim") -- Packer can manage itself

	-- Colorschemes
	use({
		"phha/zenburn.nvim",
		config = function()
			require("zenburn").setup()
		end,
		disable = true,
	})
	use({ "jacoborus/tender.vim", event = "BufWinEnter", config = "vim.cmd('colorscheme tender')" })

	-- Vimwiki
	use({ "vimwiki/vimwiki", cmd = { "VimwikiIndex", "cd $HOME/vimwiki" } })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		cmd = "Telescope",
		config = function()
			require("caed.telescope-config")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
		event = "BufWinEnter",
		config = "require('caed.treesitter-config')",
	})

	-- NvimTree
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("caed.nvim-tree-config")
		end,
		-- cmd = "NvimTreeToggle",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- COC
	use({ "neoclide/coc.nvim", branch = "release", config = "require('caed.coc-config')" })

	-- Code Runner
	use({
		"CRAG666/code_runner.nvim",
		requires = "nvim-lua/plenary.nvim",
		cmd = "RunCode",
		config = "require('caed.code_runner-config')",
	})

	use({
		"honza/vim-snippets",
		event = "InsertEnter",
		config = function()
			vim.cmd("let g:coc_snippet_next = '<tab>'")
			vim.cmd("let g:coc_snippet_prev = '<S-tab>'")
		end,
	})

	-- END
	if packer_bootstrap then
		require("packer").sync()
	end
end)
