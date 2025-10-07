return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		--keys = {
		--	{
		--		"<leader>?",
		--		function()
		--			require("which-key").show({ global = false })
		--		end,
		--		desc = "Buffer Local Keymaps (which-key)",
		--	},
		--},
		config = function()
			local wk = require("which-key")
			wk.setup({
				win = {
					border = "rounded",
					padding = { 2, 2 },
				},
			})
			wk.add({
				{ "<leader>g", group = "Git" },
				{ "<leader>f", group = "File" },
				{ "<leader>c", group = "Code" },
				{ "<leader>r", group = "Remote" },
                { "<leader>L", group = "Lazy" },
			})
		end,
	},
}
