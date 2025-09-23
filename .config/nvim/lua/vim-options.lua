-- Set hotkey leader
vim.g.mapleader = " "

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- Set tabs to 4 wide
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.termguicolors = true
vim.opt.mousemoveevent = true

-- Show virtual text and signs for errors
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- Navigate vim panes better
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {})

-- Swap paste after/before cursor binds
vim.keymap.set("n", "p", "P", { noremap = true })
vim.keymap.set("n", "P", "p", { noremap = true })
