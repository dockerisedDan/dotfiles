return {
    {
        "akinsho/bufferline.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            require("bufferline").setup({
                options = {
                    separator_style = "slant",
                    show_buffer_close_icons = true,
                    middle_mouse_command = "bdelete %d",
                    hover = {
                        enabled = true,
                        delay = 0,
                        reveal = { "close" },
                    },
                },
            })
        end,
    },
}
