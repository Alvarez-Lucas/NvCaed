-- Imports
local cmp = require("cmp")
local luasnip = require("luasnip")
--.filetype_extend("vimwiki", { "markdown" })
local lspkind = require("lspkind")

-- load vs-code like snippets from plugins (e.g. friendly-snippets)
-- require("luasnip/loaders/from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
		["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
		["<C-e>"] = cmp.mapping.abort(), -- close completion window
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
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
	}),

	-- sources for autocompletion
	sources = cmp.config.sources({
		{ name = "luasnip" }, -- snippets
		{ name = "nvim_lsp" }, -- lsp
		{ name = "buffer" }, -- text within current buffer
		{ name = "path" }, -- file system paths
	}),

	-- configure lspkind for vs-code like icons
	-- formatting = {
	-- 	format = lspkind.cmp_format({
	-- 		maxwidth = 50,
	-- 		ellipsis_char = "...",
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
	-- 		return lspkind.cmp_format({ with_text = false })(entry, vim_item)
	-- 	end,
	-- },

	window = {
		completion = {
			winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = -3,
			side_padding = 0,
		},
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. strings[1] .. " "
			kind.menu = "    (" .. strings[2] .. ")"

			return kind
		end,
	},
})
