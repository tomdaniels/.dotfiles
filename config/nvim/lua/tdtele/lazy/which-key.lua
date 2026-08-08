return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>t", group = "TypeScript" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "Find" },
      { "<leader>s", group = "Search" },
      { "<leader>d", group = "Diff / Docs" },
    },
  },
  keys = {
    {
      "<leader>k",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
