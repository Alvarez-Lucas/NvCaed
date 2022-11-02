require("FTerm").setup({
	cmd = "C:\\Users\\lucas\\AppData\\Local\\Microsoft\\WindowsApps\\Microsoft.PowerShell_8wekyb3d8bbwe\\pwsh.exe --nologo",
})

vim.api.nvim_create_user_command("FTermToggle", require("FTerm").toggle, { bang = true })
