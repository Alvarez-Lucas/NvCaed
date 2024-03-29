return {
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({
			fast_wrap = {
				-- TODO: Find a new bind for fast_wrap
				-- map = "<C-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = [=[[%'%"%>%]%)%}%,]]=],
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "Search",
				highlight_grey = "Comment",
			},
		})
	end,
}
