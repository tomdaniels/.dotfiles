vim.keymap.set("n", "<tab>",     ":bn<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-tab>",   ":bp<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close Buffer" })
