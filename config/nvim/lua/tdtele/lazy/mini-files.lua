return {
  "nvim-mini/mini.files",
  version = false,
  opts = {
    mappings = {
      close = "<Esc>",
    },
  },
  keys = {
    {
      "-",
      function()
        local bufname = vim.api.nvim_buf_get_name(0)
        require("mini.files").open(bufname ~= "" and bufname or vim.fn.getcwd())
      end,
      desc = "Open mini.files",
    },
  },
}
