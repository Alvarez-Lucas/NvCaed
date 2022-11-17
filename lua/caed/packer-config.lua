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
	-- use("lewis6991/impatient.nvim")
	-- use("nathom/filetype.nvim")
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
		requires = { { "nvim-lua/plenary.nvim" } },
		cmd = "Telescope",
		config = function()
			require("caed.telescope-config")
		end,
	})

	-- zf for Telescope
	-- adds better fuzzy searching by prioritizing file names
	use("natecraddock/telescope-zf-native.nvim")

	-- Telescope Zoxide
	use({
		"jvgrootveld/telescope-zoxide",
	})

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
					"taplo",
					"pyright",
					"sumneko_lua",
					"remark_ls",
					"powershell_es",
				},
				automatic_installation = true,
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
					"prettier",
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
	-- use neovim in web browser
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
		disable = false,
	})

	-- staline
	-- a very simple status line
	use({
		"tamton-aquib/staline.nvim",
		config = function()
			-- require("caed.lualine-config")
			require("staline").setup({
				sections = {
					left = { "  ", "mode", " ", "branch", " ", "lsp" },
					mid = {},
					right = { "file_name", "line_column" },
				},
				mode_colors = {
					i = "#d08f70",
					n = "#88c0d0",
					c = "#a3be8c",
					v = "#b988b0",
				},
				defaults = {
					true_colors = true,
					line_column = " [%l/%L] :%c  ",
					branch_symbol = " ",
				},
			})
		end,
		disable = true,
	})

	-- Feline
	-- second most popular status bar, we will see
	use({
		"feline-nvim/feline.nvim",
		config = function()
			local line_ok, feline = pcall(require, "feline")
			if not line_ok then
				return
			end

			local one_monokai = {
				fg = "#abb2bf",
				bg = "#1e2024",
				green = "#98c379",
				yellow = "#e5c07b",
				purple = "#c678dd",
				orange = "#d19a66",
				peanut = "#f6d5a4",
				red = "#e06c75",
				aqua = "#61afef",
				darkblue = "#282c34",
				dark_red = "#f75f5f",
			}

			local vi_mode_colors = {
				NORMAL = "green",
				OP = "green",
				INSERT = "yellow",
				VISUAL = "purple",
				LINES = "orange",
				BLOCK = "dark_red",
				REPLACE = "red",
				COMMAND = "aqua",
			}

			local c = {
				vim_mode = {
					provider = {
						name = "vi_mode",
						opts = {
							show_mode_name = true,
							-- padding = "center", -- Uncomment for extra padding.
						},
					},
					hl = function()
						return {
							fg = require("feline.providers.vi_mode").get_mode_color(),
							bg = "darkblue",
							style = "bold",
							name = "NeovimModeHLColor",
						}
					end,
					left_sep = "block",
					right_sep = "block",
				},
				gitBranch = {
					provider = "git_branch",
					hl = {
						fg = "peanut",
						bg = "darkblue",
						style = "bold",
					},
					left_sep = "block",
					right_sep = "block",
				},
				gitDiffAdded = {
					provider = "git_diff_added",
					hl = {
						fg = "green",
						bg = "darkblue",
					},
					left_sep = "block",
					right_sep = "block",
				},
				gitDiffRemoved = {
					provider = "git_diff_removed",
					hl = {
						fg = "red",
						bg = "darkblue",
					},
					left_sep = "block",
					right_sep = "block",
				},
				gitDiffChanged = {
					provider = "git_diff_changed",
					hl = {
						fg = "fg",
						bg = "darkblue",
					},
					left_sep = "block",
					right_sep = "right_filled",
				},
				separator = {
					provider = "",
				},
				fileinfo = {
					provider = {
						name = "file_info",
						opts = {
							type = "relative-short",
						},
					},
					hl = {
						style = "bold",
					},
					left_sep = " ",
					right_sep = " ",
				},
				diagnostic_errors = {
					provider = "diagnostic_errors",
					hl = {
						fg = "red",
					},
				},
				diagnostic_warnings = {
					provider = "diagnostic_warnings",
					hl = {
						fg = "yellow",
					},
				},
				diagnostic_hints = {
					provider = "diagnostic_hints",
					hl = {
						fg = "aqua",
					},
				},
				diagnostic_info = {
					provider = "diagnostic_info",
				},
				lsp_client_names = {
					provider = "lsp_client_names",
					hl = {
						fg = "purple",
						bg = "darkblue",
						style = "bold",
					},
					left_sep = "left_filled",
					right_sep = "block",
				},
				file_type = {
					provider = {
						name = "file_type",
						opts = {
							filetype_icon = true,
							case = "titlecase",
						},
					},
					hl = {
						fg = "red",
						bg = "darkblue",
						style = "bold",
					},
					left_sep = "block",
					right_sep = "block",
				},
				file_encoding = {
					provider = "file_encoding",
					hl = {
						fg = "orange",
						bg = "darkblue",
						style = "italic",
					},
					left_sep = "block",
					right_sep = "block",
				},
				position = {
					provider = "position",
					hl = {
						fg = "green",
						bg = "darkblue",
						style = "bold",
					},
					left_sep = "block",
					right_sep = "block",
				},
				line_percentage = {
					provider = "line_percentage",
					hl = {
						fg = "aqua",
						bg = "darkblue",
						style = "bold",
					},
					left_sep = "block",
					right_sep = "block",
				},
				scroll_bar = {
					provider = "scroll_bar",
					hl = {
						fg = "yellow",
						style = "bold",
					},
				},
			}

			local left = {
				c.vim_mode,
				c.gitBranch,
				c.gitDiffAdded,
				c.gitDiffRemoved,
				c.gitDiffChanged,
				c.separator,
			}

			local middle = {
				c.fileinfo,
				c.diagnostic_errors,
				c.diagnostic_warnings,
				c.diagnostic_info,
				c.diagnostic_hints,
			}

			local right = {
				c.lsp_client_names,
				c.file_type,
				c.file_encoding,
				c.position,
				c.line_percentage,
				c.scroll_bar,
			}

			local components = {
				active = {
					left,
					middle,
					right,
				},
				inactive = {
					left,
					middle,
					right,
				},
			}

			feline.setup({
				components = components,
				theme = one_monokai,
				vi_mode_colors = vi_mode_colors,
			})
			-- require("feline").setup()
		end,
		disable = true,
	})

	-- colorizer
	use({
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
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
