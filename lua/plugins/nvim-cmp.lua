return {
	-- event = "InsertEnter",
	"hrsh7th/nvim-cmp",

	config = function()
		-- gray
		vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { bg = "NONE", strikethrough = true, fg = "#839496" })
		-- blue
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#2aa198" })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { link = "CmpIntemAbbrMatch" })
		-- light blue
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { bg = "NONE", fg = "#268bd2" })
		vim.api.nvim_set_hl(0, "CmpItemKindInterface", { link = "CmpItemKindVariable" })
		vim.api.nvim_set_hl(0, "CmpItemKindText", { link = "CmpItemKindVariable" })
		-- pink
		vim.api.nvim_set_hl(0, "CmpItemKindFunction", { bg = "NONE", fg = "#719e07" })
		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { link = "CmpItemKindFunction" })
		-- front
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { bg = "NONE", fg = "#268bd2" })
		vim.api.nvim_set_hl(0, "CmpItemKindProperty", { link = "CmpItemKindKeyword" })
		vim.api.nvim_set_hl(0, "CmpItemKindUnit", { link = "CmpItemKindKeyword" })

		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local luasnip = require("luasnip")

		-- moonfly border
		local winhighlight = {
			winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
		}

		local has_words_before = function()
			unpack = unpack or table.unpack
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		require("luasnip.loaders.from_vscode").lazy_load()

		-- icons
		-- local cmp_kinds = {
		-- 	Text = "  ",
		-- 	Method = "  ",
		-- 	Function = "  ",
		-- 	Constructor = "  ",
		-- 	Field = "  ",
		-- 	Variable = "  ",
		-- 	Class = "  ",
		-- 	Interface = "  ",
		-- 	Module = "  ",
		-- 	Property = "  ",
		-- 	Unit = "  ",
		-- 	Value = "  ",
		-- 	Enum = "  ",
		-- 	Keyword = "  ",
		-- 	Snippet = "  ",
		-- 	Color = "  ",
		-- 	File = "  ",
		-- 	Reference = "  ",
		-- 	Folder = "  ",
		-- 	EnumMember = "  ",
		-- 	Constant = "  ",
		-- 	Struct = "  ",
		-- 	Event = "  ",
		-- 	Operator = "  ",
		-- 	TypeParameter = "  ",
		-- }
		--
		local cmp_kinds = {
			Text = "",
			Method = "",
			Function = "󰡱",
			Constructor = "󱁤",
			Field = "󰽐",
			Variable = "",
			Class = "",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "",
			Enum = "",
			Keyword = "",
			Snippet = "",
			Color = "",
			File = "",
			Reference = "",
			Folder = "",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰬛",
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},

			-- window = {
			-- 	completion = {
			-- 		col_offset = -2,
			-- 		side_padding = 1,
			-- 	},
			-- },
			-- window = {
			-- 	completion = cmp.config.window.bordered(),
			-- 	documentation = cmp.config.window.bordered(),
			-- },

			-- window = {
			-- 	completion = cmp.config.window.bordered(winhighlight),
			-- 	documentation = cmp.config.window.bordered(winhighlight),
			-- },

			-- formatting = {
			-- 	format = lspkind.cmp_format({
			-- 		mode = "text_symbol",
			-- 		menu = {
			-- 			buffer = "[Buffer]",
			-- 			nvim_lsp = "[LSP]",
			-- 			luasnip = "[LuaSnip]",
			-- 			nvim_lua = "[Lua]",
			-- 			latex_symbols = "[Latex]",
			-- 		},
			-- 	}),
			-- },
			-- formatting = {
			-- 	format = function(entry, vim_item)
			-- 		if vim.tbl_contains({ "path" }, entry.source.name) then
			-- 			local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
			-- 			if icon then
			-- 				vim_item.kind = icon
			-- 				vim_item.kind_hl_group = hl_group
			-- 				return vim_item
			-- 			end
			-- 		end
			-- 		return require("lspkind").cmp_format({ with_text = false })(entry, vim_item)
			-- 	end,
			-- },
			--

			-- this is what we were on
			-- formatting = {
			-- 	format = function(_, vim_item)
			-- 		vim_item.kind = (cmp_kinds[vim_item.kind] or "")
			-- 		return vim_item
			-- 	end,
			-- },

			formatting = {
				fields = { "abbr", "kind" },
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s %s", cmp_kinds[vim_item.kind], vim_item.kind)
					-- vim_item.menu = ({
					-- 	buffer = "[Buffer]",
					-- 	nvim_lsp = "[LSP]",
					-- 	luasnip = "[LuaSnip]",
					-- 	nvim_lua = "[Lua]",
					-- 	latex_symbols = "[LaTeX]",
					-- })[entry.source.name]
					return vim_item
				end,
			},

			view = {
				entries = { name = "custom", selection_order = "near_cursor" },
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- they way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-j>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- they way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<C-k>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources(
				-- { { name = "luasnip" } }, -- For luasnip users.
				-- { { name = "nvim_lsp" }, { name = "buffer" } }
				{
					-- { name = "nvim_lsp_signature_help" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "nvim_lsp" },
					{ name = "buffer" },
				}
			),
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
			}, {
				{ name = "buffer" },
			}),
		})

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
				{ name = "cmdline_history" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline_history" },
				{ name = "cmdline" },
			}),
		})
	end,
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "rafamadriz/friendly-snippets" },
		{ "onsails/lspkind.nvim" },
		{ "dmitmel/cmp-cmdline-history" },
		-- { "hrsh7th/cmp-nvim-lsp-signature-help" },
	},
}
