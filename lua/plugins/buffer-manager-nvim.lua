return {
	lazy = true,
	"j-morano/buffer_manager.nvim",
	events = "VeryLazy",
	keys = {
		-- { "<leader>b", '<cmd>lua require("buffer_manager.ui").toggle_quick_menu()<cr>', desc = "" },
		{
			"<leader>b",
			function()
				require("buffer_manager.ui").toggle_quick_menu()
			end,
			desc = "",
		},
		-- {
		-- 	"<leader>B",
		-- 	function()
		-- 		require("buffer_manager.ui").toggle_quick_menu()
		--
		-- 		vim.defer_fn(function()
		-- 			vim.fn.feedkeys("/")
		-- 		end, 50)
		-- 	end,
		-- 	desc = "",
		-- },
		{ "<Tab>", '<cmd>lua require("buffer_manager.ui").nav_next()<cr>', desc = "" },
		{ "<S-Tab>", '<cmd>lua require("buffer_manager.ui").nav_prev()<cr>', desc = "" },
		{ "<S-l>", '<cmd>lua require("buffer_manager.ui").nav_next()<cr>', desc = "" },
		{ "<S-h>", '<cmd>lua require("buffer_manager.ui").nav_prev()<cr>', desc = "" },
	},
	opts = {
		line_keys = "1234567890",
		select_menu_item_commands = {
			edit = {
				key = "<CR>",
				command = "edit",
			},
		},
		focus_alternate_buffer = false,
		short_file_names = false,
		short_term_names = false,
		loop_nav = false,
		highlight = "",
		win_extra_options = {},
		-- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		borderchars = { "", "", "", "", "", "", "", "" },
		format_function = nil,
		order_buffers = nil,
		show_indicators = nil,
	},
}
