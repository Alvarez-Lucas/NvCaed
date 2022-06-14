local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("z", "  > Jump Directory", "<cmd>Telescope zoxide list<cr>"),
	dashboard.button("f", "  > Find file", ":Telescope find_files<CR>"),
	dashboard.button("e", "  > File Explorer", ":NvimTreeOpen<CR>"),
	dashboard.button("n", "  > New file", ":ene <BAR> startinsert <CR>"),
	-- dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("w", "  > Open Vim Wiki", ":VimwikiIndex<CR>"),
	dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
	dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
}

dashboard.section.footer.val = {
	-- "Lucas Alvarez | Software Engineer",
	-- "Hard work often pays off after time,","  but laziness always pays off now.",
	"WORKING TOMORROW FOR A BETTER TODAY",
}
-- Send config to alpha
alpha.setup(dashboard.opts)

dashboard.section.header.opts.hl = "Include"
dashboard.section.footer.opts.hl = "Keyword"

-- -- Disable folding on alpha buffer
-- vim.cmd([[
--     autocmd FileType alpha setlocal nofoldenable
-- ]])
