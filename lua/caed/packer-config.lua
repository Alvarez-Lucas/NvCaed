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
	use("lewis6991/impatient.nvim")
	use("nathom/filetype.nvim")
	use("wbthomason/packer.nvim") -- Packer can manage itself

	-- Colorschemes

	--Zenburn
	use({
		"phha/zenburn.nvim",
		config = function()
			require("zenburn").setup()
		end,
		disable = true,
	})

	-- Gruvbox
	use({
		"luisiacc/gruvbox-baby",
		config = function()
			require("caed.gruvbox-baby-config")
			vim.cmd([[colorscheme gruvbox-baby]])
		end,
		disable = false,
	})

	-- One Dark
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("caed.onedark-config")
			require("onedark").load()
		end,
		disable = true,
	})

	-- Tender
	use({ "jacoborus/tender.vim", config = "vim.cmd('colorscheme tender')", disable = true })

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

	-- Telescope Zoxide
	use({
		"jvgrootveld/telescope-zoxide",
	})

	-- Telescope Bookmarks
	use({
		"dhruvmanila/telescope-bookmarks.nvim",
		config = function()
			require("caed.telecope-bookmarks-config")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
		config = "require('caed.treesitter-config')",
	})

	-- Indent blankline
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = "require('caed.indent-blankline-config')",
	})

	-- Comment
	use({
		"numToStr/Comment.nvim",
		keys = { "gc", "gcc", "gbc" },
		config = function()
			require("Comment").setup()
		end,
	})

	-- nvim autopairs
	use({
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("caed.nvim-autopairs-config")
		end,
		after = "nvim-treesitter",
	})

	-- NvimTree
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("caed.nvim-tree-config")
		end,
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	-- Code Runner
	use({
		"CRAG666/code_runner.nvim",
		requires = "nvim-lua/plenary.nvim",
		cmd = "RunCode",
		config = "require('caed.code_runner-config')",
	})

	-- COC
	use({ "neoclide/coc.nvim", branch = "release", config = "require('caed.coc-config')" })

	--  vim-Snippets for COC
	--  TODO
	use({
		"honza/vim-snippets",
		-- event = "InsertEnter",
		config = function()
			vim.cmd("let g:coc_snippet_next = '<tab>'")
			vim.cmd("let g:coc_snippet_prev = '<S-tab>'")
		end,
	})

	-- Which Key
	use({
		"folke/which-key.nvim",
		config = function()
			require("caed.which-key-config")
		end,
	})

	-- Coc Current Word
	use({
		"IngoMeyer441/coc_current_word",
		config = function()
			require("caed.coc_current_word-config")
		end,
	})

	-- Alpha Dashboard
	use({
		"goolord/alpha-nvim",
		config = function()
			require("caed.alpha-nvim-config")
		end,
	})

	-- Lightspeed
	use({
		"ggandor/lightspeed.nvim",
		keys = { "<leader>j" },
		config = function()
			require("caed.lightspeed-config")
		end,
	})

	-- use({ "tpope/vim-surround" })

	use({
		"machakann/vim-sandwich",
		keys = { "sa", "sd", "sr" },
	})

	-- Vim Bbye
	use({
		"moll/vim-bbye",
		cmd = { "Bdelete", "Bwipeout" },
	})

	-- BufferLine
	use({
		"akinsho/bufferline.nvim",
		requires = { "kyazdani42/nvim-web-devicons", "neoclide/coc.nvim" },
		config = function()
			require("caed.bufferline-config")
		end,
	})

	-- lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true, "neoclide/coc.nvim" },
		config = function()
			require("caed.lualine-config")
		end,
	})

	-- Lazy Git
	use({
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
	})

	-- END
	if packer_bootstrap then
		require("packer").sync()
	end
end)
