-- code actions
vim.api.nvim_set_keymap('v', '<leader>.', ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, desc = "Code Actions" })
vim.api.nvim_set_keymap('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>', { noremap = true })

-- folding code
vim.api.nvim_set_keymap('n', 'z[', 'zf%', { noremap = true })
vim.api.nvim_set_keymap('n', 'z]', 'zo', { noremap = true })

-- float the diagnostics window
vim.api.nvim_set_keymap('n', '<leader>df', ':lua vim.diagnostic.open_float { border = "rounded" } <CR>', {
  noremap = true, desc = "[D]iagnostics [F]loat"
})

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
