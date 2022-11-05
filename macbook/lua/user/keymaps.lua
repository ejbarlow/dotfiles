local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("i", "kj", "<Esc>", opts)
keymap("i", "jk", "<Esc>", opts)

keymap("v", "kj", "<Esc>", opts)
keymap("v", "jk", "<Esc>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<C-t>", "<cmd>Telescope live_grep<cr>", opts)

keymap("n", "<C-p>", "<cmd>NnnExplorer<cr>", opts)

keymap("n", "gdh", "<cmd>diffget //2<cr>", opts)
keymap("n", "gdl", "<cmd>diffget //3<cr>", opts)

keymap("n", "<leader>m", "<cmd>make<cr>", opts)
