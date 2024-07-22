return {
  "Asheq/close-buffers.vim",
  init = function()
    -- close all other buffers
    vim.keymap.set("n", "<leader>d", ":Bdelete other<CR>", { desc = "Close (Destroy) Other Buffers" })

    -- close current buffer
    vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Close Current Buffer" })
  end,
}
