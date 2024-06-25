-- move lines by visual selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- folding code
vim.keymap.set('n', 'z[', 'zf%')
vim.keymap.set('n', 'z]', 'zo')

-- print buffers working directory
vim.keymap.set('n', '<leader>wd', function () print(vim.fn.expand("%")) end)
