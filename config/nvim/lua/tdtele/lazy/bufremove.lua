return {
  "nvim-mini/mini.bufremove",
  version = false,
  keys = {
    {
      "<leader>x",
      function()
        require("mini.bufremove").delete(0, false)
      end,
      desc = "Close Current Buffer",
    },
    {
      "<leader>X",
      function()
        local mini_bufremove = require("mini.bufremove")
        local current = vim.api.nvim_get_current_buf()
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if buf ~= current and vim.bo[buf].buflisted then
            mini_bufremove.delete(buf, false)
          end
        end
      end,
      desc = "Close Other Buffers",
    },
  },
}
