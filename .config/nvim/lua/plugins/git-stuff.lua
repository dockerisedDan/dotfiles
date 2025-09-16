return {
	{
		"tpope/vim-fugitive",

		vim.keymap.set("n", "<leader>gs", ":Git status<CR>", { desc = "Git Status" }),
		vim.keymap.set("n", "<leader>ga", ":Git add .<CR>", { desc = "Git Add" }),
		vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git Commit" }),
		vim.keymap.set("n", "<leader>gpl", ":Git pull origin main<CR>", { desc = "Git Pull" }),
		vim.keymap.set("n", "<leader>gps", ":Git push origin main<CR>", { desc = "Git Push" }),
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gd", ":Gitsigns preview_hunk<CR>", { desc = "Git Hunks" })
			vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Git Reset Hunks" })
            vim.keymap.set("n", "<leader>gdf", ":Gitsigns diffthis<CR>", { desc = "Git Diff" })
		end,
	},
}
