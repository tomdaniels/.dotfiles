require('neo-tree').setup({
  window = {
    position = "right",
    width = 55,

    mappins = {
      ['\b'] = "close_node",
    },
  },
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
  }
})

vim.keymap.set("n", "<C-f>", ":Neotree toggle<CR>")
