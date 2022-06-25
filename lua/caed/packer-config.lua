-- api shorteners
local fn = vim.fn

-- PackerCompile on update
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer-config.lua source <afile> | PackerCompile
  augroup end
]])

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

	-- Moonfly
	use({
		"bluz71/vim-moonfly-colors",
		config = function()
			require("caed.vim-moonfly-colors-config")
			vim.cmd([[colorscheme moonfly]])
		end,
		disable = false,
	})

	-- Zenburn
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
		disable = true,
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
	use({
		"vimwiki/vimwiki",
		cmd = { "Vimwiki", "VimwikiIndex" },
		setup = function()
			require("caed.vimwiki-setup")
		end,
	})

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
		-- results in slow block comments on first load
		-- keys = { "gc", "gcc", "gbc" },
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
		setup = function()
			vim.g.lightspeed_no_default_keymaps = 0
		end,
	})

	-- use({ "tpope/vim-surround" })

	-- Vim Sandwich
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
		disable = true,
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

	-- Cursor line
	use({
		"yamatsum/nvim-cursorline",
		config = function()
			require("caed.nvim-cursorline-config")
		end,
	})

	-- TS Rainbow
	use({
		"p00f/nvim-ts-rainbow",
		config = function()
			require("caed.nvim-ts-rainbow-config")
		end,
	})

	-- mkdir
	use({
		"jghauser/mkdir.nvim",
		event = "BufWritePre",
	})

	-- cybu buffer switcher
	use({
		"ghillb/cybu.nvim",
		branch = "v1.x", -- won't receive breaking changes
		-- branch = "main", -- timely updates
		requires = { "kyazdani42/nvim-web-devicons" }, --optional
		config = function()
			require("caed.cybu-config")
		end,
	})

	-- TODO Remove and check readme
	-- use({ "lmburns/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

	-- TODO
	use({
		"fannheyward/telescope-coc.nvim",
		-- config = function()
		-- 	require("caed.cybu-config")
		-- end,
	})

	use({
		"m-demare/hlargs.nvim",
		requires = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("hlargs").setup({
				color = "#85dc85", -- moonfly colors
			})
		end,
	})

	-- Tree sitter text objects

	-- TODO vil and val
	-- use({
	-- 	"kana/vim-textobj-line",
	-- 	-- config = function()
	-- 	-- 	require("caed.cybu-config")
	-- 	-- end,
	-- })

	-- END
	if packer_bootstrap then
		require("packer").sync()
	end
end)
