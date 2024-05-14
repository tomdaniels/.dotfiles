-- "current" working directory (a buffer relative pwd()) 
vim.keymap.set('n', '<leader>wd', function () print(vim.fn.expand("%")) end)

-- reload nvim
vim.keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>')

-- folding code
vim.keymap.set('n', 'z[', 'zf%')
vim.keymap.set('n', 'z]', 'zo')

-- cycle through buffers
vim.keymap.set("n", "<tab>",     ":bn<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-tab>",   ":bp<CR>", { desc = "Previous Buffer" })

-- close current buffer
vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close Current Buffer" })

-- close all other buffers (via https://github.com/Asheq/close-buffers.vim)
vim.keymap.set("n", "<leader>d", ":Bdelete other<CR>", { desc = "Close (Destroy) Other Buffers" })

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience (inherited from kickstart project)
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymap
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
