require("code_runner").setup({
	-- choose default mode (valid term, tab, float, toggle)
	mode = "term",
	-- mode = "float",
	-- Focus on runner window(only works on toggle, term and tab mode)
	focus = true,
	-- startinsert (see ':h inserting-ex')
	startinsert = false,
	term = {
		--  Position to open the terminal, this option is ignored if mode is tab
		-- position = "vert botright split",
		position = "bot",
		-- window size, this option is ignored if tab is true
		-- size = 80,
		size = 18,
	},
	float = {
		-- Window border (see ':h nvim_open_win')
		border = "none",

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
	project = {
		["C:\\Users\\lucas\\rustlings"] = {
			name = "Rustlings",
			description = "Rust course",
			command = "rustlings watch",
		},
	},
	filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "python -u",
		typescript = "deno run",
		javascript = "node",
		-- rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
		-- rust = "cd $dir && cargo run",
		rust = "cargo run",
	},
})
