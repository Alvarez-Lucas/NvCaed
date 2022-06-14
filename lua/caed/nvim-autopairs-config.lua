local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")

-- npairs.add_rules({
-- 	Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node({ "string", "comment" })),
-- 	Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node({ "function" })),
-- })

npairs.setup({
	map_cr = false,
	check_ts = true,
	ts_config = {
		lua = { "string" }, -- it will not add a pair on that treesitter node
		javascript = { "template_string" },
		-- java = false, -- don't check treesitter on java
	},

	fast_wrap = {
		map = "<C-f>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = [=[[%'%"%)%>%]%)%}%,]]=],
		end_key = "f",
		-- keys = "qwertyuiopzxcvbnmasdfghjkl",
		keys = "asdghjkl;'",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
})

local ts_conds = require("nvim-autopairs.ts-conds")

-- skip it, if you use another global object
_G.MUtils = {}

MUtils.completion_confirm = function()
	if vim.fn.pumvisible() ~= 0 then
		return vim.fn["coc#_select_confirm"]()
	else
		return npairs.autopairs_cr()
	end
end

remap("i", "<CR>", "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })
