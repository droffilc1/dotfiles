local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader keys
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove highlighting
keymap("n", "<ESC>", ":noh<CR>", opts)
keymap("i", "jk", "<ESC>", opts)

-- Reload config
keymap("n", "<leader>rr", ":source $MYVIMRC<CR>", { desc = "Reload config" })

keymap("n", "<leader>w", ":write<CR>", { desc = "Write file" })
keymap("n", "<leader>q", ":quit<CR>", { desc = "Quit neovim" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Close current buffer
keymap("n", "<leader>x", ":bd<CR>", opts)
-- Open alternate file
keymap("n", "<leader>af", "<C-^><CR>", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize +2<CR>", opts)
keymap("n", "<A-Down>", ":resize -2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Delete buffer with built-in function
keymap("n", "<leader>bd", function()
	vim.cmd("bdelete")
end)

-- Quickfix
keymap("n", "<M-j>", "<cmd>cnext<CR>")
keymap("n", "<M-k>", "<cmd>cprev<CR>")

-- Terminal
keymap("n", "<leader>st", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 15)
end)
