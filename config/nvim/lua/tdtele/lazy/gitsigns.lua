local closure = require("tdtele.utils").closure

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

        local nmap = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end

        nmap("<leader>gp", closure(gitsigns.nav_hunk, "prev"), "[G]o to [P]revious Hunk")
        nmap("<leader>gn", closure(gitsigns.nav_hunk, "next"), "[G]o to [N]ext Hunk")
        nmap("<leader>gm", closure(gitsigns.blame_line, { full = true }), "[G]it [M]essage (full commit)")

        nmap("<leader>ph", gitsigns.preview_hunk, "[P]review [H]unk")
        nmap("<leader>gb", gitsigns.blame, "[G]it [B]lame panel")
        nmap("<leader>gs", gitsigns.stage_hunk, "[G]it [S]tage Hunk")
        nmap("<leader>gx", gitsigns.reset_hunk, "[G]it Discard Hunk (reset)")
        nmap("<leader>gd", gitsigns.diffthis, "[G]it [D]iffthis (vs index)")
      end,
    })
  end,
}
