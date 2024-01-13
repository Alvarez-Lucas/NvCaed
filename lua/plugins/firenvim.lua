return {
	{
		"glacambre/firenvim",

		-- Lazy load firenvim
		-- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
		lazy = not vim.g.started_by_firenvim,
		-- lazy = false,
		build = function()
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
	},
}
