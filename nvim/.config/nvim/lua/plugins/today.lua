return ({
    {
        "VVoruganti/today.nvim",
        config = function()
            require("today").setup({
                local_root = "/home/daniel/Documents/journal",
            })
        end,
    },
})
