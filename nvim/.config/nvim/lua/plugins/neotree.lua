return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
            },
            close_if_last_window = true,
            event_handlers = {
                {
                    event = "file_opened",
                    handler = function(file_path)
                        require("neo-tree.command").execute({ action = "close" })
                    end,
                },
            },
            window = {
                mappings = {
                    ["p"] = {
                        "toggle_preview",
                        config = {
                            use_float = true,
                        },
                    },
                },
            },
        })
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle right<CR>", {})
		vim.keymap.set("n", "<C-g>", ":Neotree git_status reveal right<CR>", {})
	end,
}
