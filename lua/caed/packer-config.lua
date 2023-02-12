-- api shorteners
local fn = vim.fn

-- PackerCompile on update
vim.cmd([[
  augroup packer_user_config autocmd!
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

	-- Start Colorschemes

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

	-- End Colorschemes

	-- Vimwiki
	-- wiki for personal notes
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
		-- we also got zf-native
		requires = { "nvim-lua/plenary.nvim" },
		-- cmd = "Telescope",
		-- module = "telescope",
		config = function()
			require("caed.telescope-config")
		end,
	})

	use({ "natecraddock/telescope-zf-native.nvim" })

	-- Telescope Zoxide
	use({
		"jvgrootveld/telescope-zoxide",
		-- opt = true,
		-- module = "telescope",
	})

	-- Treesitter
	-- adds syntax highlighting
	use({
		"nvim-treesitter/nvim-treesitter",
		run = "TSUpdate",
		config = "require('caed.treesitter-config')",
		-- disable = true,
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
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = "require('caed.indent-blankline-config')",
	})

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
		disable = false,
	})

	-- NvimTree
	-- side bar file explorer
	use({
		"ms-jpq/chadtree",
		branch = "chad",
		disable = true,
	})

	-- lspsaga
	-- adds ui elements for lsp
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			local saga = require("lspsaga")
			saga.setup({
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

	-- crates.nvim
	-- adds rust crates as a source for auto completion
	use({
		"saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("crates").setup()
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

	-- cmp-nvim-lsp-signature-help
	-- displaying function signatures with the current parameter emphasized
	use({
		"hrsh7th/cmp-nvim-lsp-signature-help",
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
		disable = true,
	})

	-- mason lspconfig
	-- connect mason with lspconfig
	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"taplo",
					"pyright",
					"sumneko_lua",
					"remark_ls",
					"powershell_es",
					"yamlls",
					"marksman",
					"rust_analyzer",
				},
				automatic_installation = true,
			})
		end,
		disable = true,
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
					"prettier",
				},
			})
		end,
		disable = true,
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

	-- rust-tools
	-- an alternative to rust_analyzer
	use("simrat39/rust-tools.nvim")

	-- Debugging for rust_analyzer
	use({ "mfussenegger/nvim-dap", requires = { "nvim-lua/plenary.nvim" } })

	-- firenvim
	-- use neovim in web browser
	use({
		cond = function()
			return vim.g.started_by_firenvim ~= nil
		end,
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
	-- run code
	use({
		"CRAG666/code_runner.nvim",
		requires = "nvim-lua/plenary.nvim",
		cmd = "RunCode",
		config = "require('caed.code_runner-config')",
	})

	-- Alpha Dashboard
	use({
		"goolord/alpha-nvim",
		config = function()
			require("caed.alpha-nvim-config")
		end,
		disable = false,
	})

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

	-- lualine
	-- The OG status line
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("caed.lualine-config")
		end,
	})

	-- colorizer
	use({
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		disable = false,
	})

	-- marks
	use({
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({
				-- whether to map keybinds or not. default true
				default_mappings = true,
				-- which builtin marks to show. default {}
				--
				builtin_marks = {},
				-- whether movements cycle back to the beginning/end of buffer. default true
				cyclic = true,
				-- whether the shada file is updated after modifying uppercase marks. default false
				force_write_shada = false,
				-- how often (in ms) to redraw signs/recompute mark positions.
				-- higher values will have better performance but may cause visual lag,
				-- while lower values may cause performance penalties. default 150.
				refresh_interval = 250,
				-- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
				-- marks, and bookmarks.
				-- can be either a table with all/none of the keys, or a single number, in which case
				-- the priority applies to all marks.
				-- default 10.
				sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
				-- disables mark tracking for specific filetypes. default {}
				excluded_filetypes = {},
				-- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
				-- sign/virttext. Bookmarks can be used to group together positions and quickly move
				-- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
				-- default virt_text is "".
				bookmark_0 = {
					sign = "⚑",
					virt_text = "hello world",
					-- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
					-- defaults to false.
					annotate = false,
				},
				mappings = {},
			})
		end,
		disable = true,
	})

	-- colorizer
	use({
		"SidOfc/carbon.nvim",
		config = function()
			require("carbon").setup({
				setting = "value",
			})
		end,
		disable = true,
	})

	-- nushell support
	-- i think only for treesitter
	use({
		"LhKipp/nvim-nu",
		ft = { "nu" },
		config = function()
			require("nu").setup({})
		end,
		disable = false,
	})

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
