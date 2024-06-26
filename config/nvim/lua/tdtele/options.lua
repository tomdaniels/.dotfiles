vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.netrw_altfile = 1

vim.o.undofile = true

vim.o.background = 'dark'

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.scrolloff = 15
vim.o.expandtab = true
vim.o.smartindent = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.cursorcolumn = true
vim.o.wrap = false

vim.o.termguicolors = true

-- dont highlight search matches
vim.o.hlsearch = false

-- lower case searches are case insensitive
vim.o.ignorecase = true
vim.o.smartcase = true

-- use system clipboard
vim.o.clipboard = 'unnamedplus'

-- decrease timeout & swp file generation intervals
vim.o.updatetime = 250
vim.o.timeoutlen = 300
