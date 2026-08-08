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

        vim.keymap.set("n", "<leader>gp", function()
          gitsigns.nav_hunk("prev")
        end, { buffer = bufnr, desc = "[G]o to [P]revious Hunk" })
        vim.keymap.set("n", "<leader>gn", function()
          gitsigns.nav_hunk("next")
        end, { buffer = bufnr, desc = "[G]o to [N]ext Hunk" })
        vim.keymap.set("n", "<leader>ph", gitsigns.preview_hunk, { buffer = bufnr, desc = "[P]review [H]unk" })
        vim.keymap.set("n", "<leader>gm", function()
          gitsigns.blame_line({ full = true })
        end, { buffer = bufnr, desc = "[G]it [M]essage (full commit)" })
        vim.keymap.set("n", "<leader>gb", gitsigns.blame, { buffer = bufnr, desc = "[G]it [B]lame panel" })
        vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { buffer = bufnr, desc = "[G]it [S]tage Hunk" })
        vim.keymap.set("n", "<leader>gx", gitsigns.reset_hunk, { buffer = bufnr, desc = "[G]it Discard Hunk (reset)" })
        vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { buffer = bufnr, desc = "[G]it [D]iffthis (vs index)" })
      end,
    })
  end,
}
