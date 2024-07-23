require("tdtele.options")
require("tdtele.lazy_init")
require("tdtele.keymaps")

_G.tdtele = vim.api.nvim_create_augroup("tdtele", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = tdtele,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  group = tdtele,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = tdtele,
  pattern = { "*.ts", "*.tsx" },
  callback = function()
    local biome = require("tdtele.biome")

    if biome.is_biome_avail() then
      biome.run_biome_linter()
    end
  end,
})
