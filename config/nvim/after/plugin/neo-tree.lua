require('neo-tree').setup({
  window = {
    position = "current",
  },
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
  }
})

vim.keymap.set("n", "<leader>pe", ":Neotree toggle<CR>", { desc = "[P]roject [E]xplore" })
