require("tdtele.options")
require("tdtele.lazy_init")
require("tdtele.keymaps")

vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("tdtele", { clear = true }),
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = "tdtele",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})
