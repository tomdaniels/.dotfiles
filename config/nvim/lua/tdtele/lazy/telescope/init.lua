return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },

  opts = require("tdtele.lazy.telescope.opts"),

  init = function()
    require("tdtele.lazy.telescope.theme").setup()
  end,

  config = function(_, opts)
    require("telescope").setup(opts)
    pcall(require("telescope").load_extension, "fzf")

    require("telescope").load_extension("ui-select")

    require("tdtele.lazy.telescope.keymaps").setup()
  end,
}
