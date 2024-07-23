return {
  "Asheq/close-buffers.vim",
  init = function()
    vim.keymap.set("n", "<leader>d", ":Bdelete other<CR>", { desc = "Close Other Buffers" })
    vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close Current Buffer" })
  end,
}
