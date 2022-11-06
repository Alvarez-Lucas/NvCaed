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
	-- use("lewis6991/impatient.nvim")
	-- use("nathom/filetype.nvim")
	use("wbthomason/packer.nvim") -- Packer can manage itself

	-- Colorschemes

	-- One Dark
	use({
		"NTBBloodbath/doom-one.nvim",
		setup = function()
			require("caed.doom-one-config")
		end,
		config = function()
        vim.cmd("colorscheme doom-one")
    end,
	})

	-- -- Tender
	-- use({ "jacoborus/tender.vim", config = "vim.cmd('colorscheme tender')", disable = true })

	-- -- Vimwiki
	-- use({
		-- "vimwiki/vimwiki",
		-- cmd = { "Vimwiki", "VimwikiIndex" },
		-- setup = function()
			-- require("caed.vimwiki-setup")
		-- end,
	-- })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		cmd = "Telescope",
		config = function()
			require("caed.telescope-config")
		end,
	})

	-- -- Telescope Zoxide
	-- use({
		-- "jvgrootveld/telescope-zoxide",
	-- })

	-- -- Telescope Bookmarks
	-- use({
		-- "dhruvmanila/telescope-bookmarks.nvim",
		-- config = function()
			-- require("caed.telecope-bookmarks-config")
		-- end,
	-- })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
		config = "require('caed.treesitter-config')",
	})


	-- nvim autopairs
	use({
		"windwp/nvim-autopairs",
		config = function() 
			require("nvim-autopairs").setup {} 
		end	
	})

	-- -- Indent blankline
	-- use({
		-- "lukas-reineke/indent-blankline.nvim",
		-- config = "require('caed.indent-blankline-config')",
	-- })

	-- -- Comment
	-- use({
		-- "numToStr/Comment.nvim",
		-- -- results in slow block comments on first load
		-- -- keys = { "gc", "gcc", "gbc" },
		-- config = function()
			-- require("Comment").setup()
		-- end,
	-- })


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


	use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      local saga = require("lspsaga")
      saga.init_lsp_saga({
        -- keybinds for navigation in lspsaga window
        move_in_saga = { prev = "<C-k>", next = "<C-j>" },
        -- use enter to open file with finder
        finder_action_keys = {
          open = "<CR>",
        },
        -- use enter to open file with definition preview
        definition_action_keys = {
          edit = "<CR>",
        },
      })
    end
	})

	-- COQ
	-- autocomplete
	use({
		"ms-jpq/coq_nvim",
	 	branch = 'coq',
	 	commit = '84ec5faf2aaf49819e626f64dd94f4e71cf575bc',
		setup = function()
			vim.g.coq_settings = {
  			auto_start = "shut-up",
  			keymap = {
  				recommended = false
  			},
			}
		end,
		config = function()
			vim.cmd(
				[[
" Keybindings
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
ino <silent><expr> <C-k> pumvisible() ? "\<C-p>" : "\<BS>"
				]])
		end,
	})

	-- snippets for autocomplete
	use ({
		"ms-jpq/coq.artifacts",
		branch = "artifacts",
	})

	-- mason lsp installer
	use ({ "williamboman/mason.nvim",
		config = function()
	 		require("mason").setup()
		end
	 })

	-- mason connect to lsp
	use ({
	 "williamboman/mason-lspconfig.nvim",
	 config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				 "pyright",
				 "sumneko_lua"
			}
		})
	 end
	})

	-- connect lsp with nvim
	use ({
		"neovim/nvim-lspconfig",
		config = function()
			require("caed.lsp.lspconfig-config")
		end

	})


	-- -- Code Runner
	-- use({
		-- "CRAG666/code_runner.nvim",
		-- requires = "nvim-lua/plenary.nvim",
		-- cmd = "RunCode",
		-- config = "require('caed.code_runner-config')",
	-- })

	-- -- Alpha Dashboard
	-- use({
		-- "goolord/alpha-nvim",
		-- config = function()
			-- require("caed.alpha-nvim-config")
		-- end,
	-- })

	-- -- Vim Bbye
	-- use({
		-- "moll/vim-bbye",
		-- cmd = { "Bdelete", "Bwipeout" },
	-- })

	-- -- BufferLine
	-- use({
		-- "akinsho/bufferline.nvim",
		-- requires = { "kyazdani42/nvim-web-devicons", "neoclide/coc.nvim" },
		-- config = function()
			-- require("caed.bufferline-config")
		-- end,
		-- disable = true,
	-- })

	-- -- lualine
	-- use({
		-- "nvim-lualine/lualine.nvim",
		-- requires = { "kyazdani42/nvim-web-devicons", opt = true, "neoclide/coc.nvim" },
		-- config = function()
			-- require("caed.lualine-config")
		-- end,
	-- })

	-- -- Lazy Git
	-- use({
		-- "kdheepak/lazygit.nvim",
		-- cmd = "LazyGit",
	-- })

	-- -- Cursor line
	-- use({
		-- "yamatsum/nvim-cursorline",
		-- config = function()
			-- require("caed.nvim-cursorline-config")
		-- end,
	-- })

	-- -- TS Rainbow
	-- use({
		-- "p00f/nvim-ts-rainbow",
		-- config = function()
			-- require("caed.nvim-ts-rainbow-config")
		-- end,
	-- })

	-- -- mkdir
	-- use({
		-- "jghauser/mkdir.nvim",
		-- event = "BufWritePre",
	-- })

	-- END
	if packer_bootstrap then
		require("packer").sync()
	end
end)
