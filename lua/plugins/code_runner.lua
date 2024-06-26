return {
	{
		cmd = "RunCode",
		event = "VeryLazy",
		keys = {
			{ "<leader>r", "<cmd>RunCode<cr>", desc = "Run Code" },
		},
		"CRAG666/code_runner.nvim",
		config = function()
			require("code_runner").setup({
				-- choose default mode (valid term, tab, float, toggle, buf)
				mode = "term",
				-- mode = "float",
				-- Focus on runner window(only works on toggle, term and tab mode)
				focus = true,
				-- startinsert (see ':h inserting-ex')
				startinsert = false,
				term = {
					--  Position to open the terminal, this option is ignored if mode is tab
					position = "bot",
					-- window size, this option is ignored if tab is true
					size = 8,
					-- size = 16,
					-- size = 12,
				},
				float = {
					-- Key that close the code_runner floating window
					close_key = "<ESC>",
					-- Window border (see ':h nvim_open_win')
					-- • "none": No border (default).
					-- • "single": A single line box.
					-- • "double": A double line box.
					-- • "rounded": Like "single", but with rounded corners ("╭"
					--   etc.).
					-- • "solid": Adds padding by a single whitespace cell.
					-- • "shadow": A drop shadow effect by blending with the
					--   background.
					border = "rounded",

					-- Num from `0 - 1` for measurements
					height = 0.8,
					width = 0.8,
					x = 0.5,
					y = 0.5,

					-- Highlight group for floating window/border (see ':h winhl')
					border_hl = "FloatBorder",
					float_hl = "Normal",

					-- Transparency (see ':h winblend')
					blend = 0,
				},
				filetype_path = "", -- No default path defined
				before_run_filetype = function()
					vim.cmd(":w")
				end,
				filetype = {
					javascript = "node",

					ps1 = "pwsh.exe -File $fileName -ExecutionPolicy Bypass -NoProfile",
					-- typescript = "deno run",
					typescript = "bun run",
					go = "go run .",
					java = {
						"cd $dir &&",
						"javac $fileName &&",
						"java $fileNameWithoutExt",
					},
					c = {
						"cd $dir &&",
						"gcc $fileName",
						"-o $fileNameWithoutExt &&",
						"$dir/$fileNameWithoutExt",
					},
					cpp = {
						"cd $dir &&",
						"g++ $fileName",
						"-o $fileNameWithoutExt &&",
						"$dir/$fileNameWithoutExt",
					},
					python = "python -u",
					sh = "bash",
					rust = {
						"cargo run",
						-- "cd $dir &&",
						-- "rustc $fileName &&",
						-- "$dir$fileNameWithoutExt",
					},
				},
				project_path = "", -- No default path defined
				project = {},
			})
		end,
	},
}
