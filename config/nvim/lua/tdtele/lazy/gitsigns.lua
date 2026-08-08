return {
  "lewis6991/gitsigns.nvim",
  init = function()
    vim.wo.signcolumn = "yes"
  end,
  config = function()
    require("gitsigns").setup({
      current_line_blame = true,
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        vim.keymap.set("n", "<leader>gp", gitsigns.prev_hunk, { buffer = bufnr, desc = "[G]o to [P]revious Hunk" })
        vim.keymap.set("n", "<leader>gn", gitsigns.next_hunk, { buffer = bufnr, desc = "[G]o to [N]ext Hunk" })
        vim.keymap.set("n", "<leader>ph", gitsigns.preview_hunk, { buffer = bufnr, desc = "[P]review [H]unk" })
        vim.keymap.set("n", "<leader>gm", function()
          gitsigns.blame_line({ full = true })
        end, { buffer = bufnr, desc = "[G]it [M]essage (full commit)" })
      end,
    })
  end,
}
