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
	-- colorscheme
	use({
		"NTBBloodbath/doom-one.nvim",
		setup = function()
			require("caed.doom-one-config")
		end,
		config = function()
			vim.cmd("colorscheme doom-one")
		end,
		disable = true,
	})

	-- Mellow
	-- colorscheme
	use({
		"kvrohit/mellow.nvim",
		config = function()
			vim.cmd("colorscheme mellow")
		end,
		disable = true,
	})

	-- Monokai
	-- colorscheme
	use({
		"cpea2506/one_monokai.nvim",
		config = function()
			vim.cmd("colorscheme one_monokai")
		end,
		disable = true,
	})

	-- onigiri for mariana
	-- sublime text color scheme
	use({
		"kaiuri/onigiri.nvim",
		setup = function()
			require("caed.onigiri-nvim-config")
		end,
		config = function()
			-- local mariana = require 'onigiri'.presets['mariana']
			vim.cmd("colorscheme onigiri")
		end,
		disable = true,
	})

	-- Onedark
	-- colorscheme
	use({
		"navarasu/onedark.nvim",
		config = function()
			require("caed.onedark-nvim-config")
		end,
		disable = true,
	})

	-- Onenord
	-- colorscheme
	use({
		"rmehri01/onenord.nvim",
		config = function()
			require("caed.onenord-nvim-config")
			vim.cmd("colorscheme onenord")
		end,
		disable = false,
	})

	-- Vimwiki
	use({
		"vimwiki/vimwiki",
		cmd = { "Vimwiki", "VimwikiIndex" },
		setup = function()
			require("caed.vimwiki-setup")
		end,
	})

	-- Telescope
	-- fuzzy file finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		cmd = "Telescope",
		config = function()
			require("caed.telescope-config")
		end,
	})

	-- zf for Telescope
	use("natecraddock/telescope-zf-native.nvim")

	-- -- Telescope Zoxide
	-- use({
	-- "jvgrootveld/telescope-zoxide",
	-- })

	-- Treesitter
	-- adds syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
		config = "require('caed.treesitter-config')",
	})

	-- nvim autopairs
	-- autopairs tags such as parenthesis or brackets
	use({
		"windwp/nvim-autopairs",
		config = function()
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			require("nvim-autopairs").setup({})
		end,
	})

	-- TS Rainbow
	-- adds rainbow parentheses usingn treesitter
	use({
		"p00f/nvim-ts-rainbow",
		config = function()
			require("caed.nvim-ts-rainbow-config")
		end,
	})

	-- vim illuminate
	-- adds highling for word under curosr
	use({
		"RRethy/vim-illuminate",
	})

	-- -- Indent blankline
	-- use({
	-- "lukas-reineke/indent-blankline.nvim",
	-- config = "require('caed.indent-blankline-config')",
	-- })

	-- Comment
	-- adds commands to comment blocks of code
	use({
		"numToStr/Comment.nvim",
		-- results in slow block comments on first load
		-- keys = { "gc", "gcc", "gbc" },
		config = function()
			require("Comment").setup()
		end,
	})

	-- NvimTree
	-- side bar file explorer
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

	-- lspsaga
	-- adds ui elements for lsp
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
		end,
	})

	-- COQ
	-- autocomplete engine thats really fast
	use({
		"ms-jpq/coq_nvim",
		branch = "coq",
		commit = "84ec5faf2aaf49819e626f64dd94f4e71cf575bc",
		setup = function()
			vim.g.coq_settings = {
				auto_start = "shut-up",
				keymap = {
					recommended = false,
				},
			}
		end,
		config = function()
			vim.cmd([[
" Keybindings
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
ino <silent><expr> <C-k> pumvisible() ? "\<C-p>" : "\<BS>"
				]])
		end,
		disable = true, -- while switching to cmpe
	})

	-- coq artifacts
	-- snippets for autocomplete
	use({
		"ms-jpq/coq.artifacts",
		branch = "artifacts",
		disable = true, -- while switching to cmpe
	})

	-- Lua Snip
	-- snippet engine
	use({
		"L3MON4D3/LuaSnip",
	})

	-- LSP Kind
	-- add images to autocomplete
	use({
		"onsails/lspkind.nvim",
	})

	-- nvim cmp
	-- completion engine
	use({
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		config = function()
			require("caed.nvim-cmp-config")
		end,
	})

	-- cmp buffer
	-- adds buffer as a source for auto completion
	use({
		"hrsh7th/cmp-buffer",
	})

	-- cmp path
	-- adds path as a source for auto completion
	use({
		"hrsh7th/cmp-path",
	})

	-- cmp luasnip
	-- adds luasnips as a source for auto completion
	use({
		"saadparwaiz1/cmp_luasnip",
	})

	-- cmp lsp
	-- adds lsp as a source for auto completion
	use({
		"hrsh7th/cmp-nvim-lsp",
	})

	-- friendly snippets
	-- adds snippets to luasnip
	use({
		"rafamadriz/friendly-snippets",
	})

	-- mason
	-- lsp installer
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	-- mason lspconfig
	-- connect mason with lspconfig
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"sumneko_lua",
					"remark_ls",
				},
			})
		end,
	})

	-- mason null ls
	-- configure formatters and interface with lsp?
	use({
		"jayp0521/mason-null-ls.nvim",
		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"stylua",
					"black",
				},
			})
		end,
	})

	-- lspconfig
	-- configure lsp
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("caed.lsp.lspconfig-config")
		end,
	})

	-- null ls
	-- install formatters
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("caed.lsp.null-ls-config")
		end,
	})

	-- firenvim
	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
		config = function()
			vim.cmd([[
      if exists('g:started_by_firenvim')
        au BufEnter leetcode.com_*.txt set filetype=python
        " au TextChanged * ++nested write
        " au TextChangedI * ++nested write
      end
      ]])
		end,
	})

	-- Code Runner
	use({
		"CRAG666/code_runner.nvim",
		requires = "nvim-lua/plenary.nvim",
		cmd = "RunCode",
		config = "require('caed.code_runner-config')",
	})

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
