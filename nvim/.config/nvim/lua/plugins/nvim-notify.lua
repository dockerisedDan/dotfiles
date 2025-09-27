return {
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require("notify")
			notify.setup({
				stages = "slide",
				timeout = 2500,
				render = "default",
				background_color = "#000000",
			})

			-- Replace default notify with nvim-notify
			vim.notify = notify
            vim.ui.notify = notify
		end,
	},
}
