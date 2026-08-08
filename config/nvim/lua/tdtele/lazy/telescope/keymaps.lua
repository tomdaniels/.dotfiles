local M = {}

M.setup = function()
  local nmap = function(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { desc = "Telescope | " .. desc })
  end

  -- remaps native vim jumping o.O
  nmap("-", require("telescope.builtin").find_files, "[L]ook [f]or files")
  nmap("<leader>lf", require("telescope.builtin").live_grep, "[L]ook [f]or text")
  nmap("<leader>lw", require("telescope.builtin").grep_string, "[L]ook for [W]ord under cursor")

  nmap("<leader>sg", require("telescope.builtin").git_files, "[S]earch [G]it files")
  nmap("<leader>sd", require("telescope.builtin").diagnostics, "[S]earch [D]iagnostics")
  nmap("<leader>sh", require("telescope.builtin").help_tags, "[S]earch [H]elp")

  nmap("<leader><space>", require("telescope.builtin").buffers, "[ ] existing buffers")
  nmap("<leader>?", require("telescope.builtin").oldfiles, "[?] Find recently opened files")

  nmap("<leader>/", function()
    require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
      winblend = 10,
      previewer = false,
    }))
  end, "[/] Fuzzily search in current buffer")
end

return M
