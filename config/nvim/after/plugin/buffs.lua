-- cycle through buffers
vim.keymap.set("n", "<tab>",     ":bn<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-tab>",   ":bp<CR>", { desc = "Previous Buffer" })

-- close current buffer
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close Current Buffer" })

-- close all other buffers (via https://github.com/Asheq/close-buffers.vim)
vim.keymap.set("n", "<leader>d", ":Bdelete other<CR>", { desc = "Close (Destroy) Other Buffers" })


