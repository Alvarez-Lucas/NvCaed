return {
	{

		"ThePrimeagen/harpoon",
		config = function()
			require("harpoon").setup({
				global_settings = {
					-- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
					save_on_toggle = false,

					-- saves the harpoon file upon every change. disabling is unrecommended.
					save_on_change = true,

					-- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
					enter_on_sendcmd = false,

					-- closes any tmux windows harpoon that harpoon creates when you close Neovim.
					tmux_autoclose_windows = false,

					-- filetypes that you want to prevent from adding to the harpoon list menu.
					excluded_filetypes = { "harpoon" },

					-- set marks specific to each git branch inside git repository
					mark_branch = false,
				},
			})

			local defaultOpts = { noremap = true, silent = true }
			-- local km = vim.api.nvim_set_keymap
			local km = vim.keymap.set
			-- Keymaps
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")
			km("n", "<leader>a", mark.add_file, defaultOpts)
			km("n", "<C-e>", ui.toggle_quick_menu, defaultOpts)
			km("n", "<S-j>", function()
				ui.nav_file(1)
			end, defaultOpts)
			km("n", "<S-k>", function()
				ui.nav_file(2)
			end, defaultOpts)
			km("n", "<S-l>", function()
				ui.nav_file(3)
			end, defaultOpts)
			km("n", "<M-j>", function()
				ui.nav_file(4)
			end, defaultOpts)
			km("n", "<M-k>", function()
				ui.nav_file(5)
			end, defaultOpts)
			km("n", "<M-l>", function()
				ui.nav_file(6)
			end, defaultOpts)
		end,
	},
}

-- TODO: Make it lazy
-- TODO: Add cmp completion to harpoon buffer
