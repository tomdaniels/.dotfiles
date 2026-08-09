local closure = require("tdtele.utils").closure

local M = {}
M.setup = function()
  local nmap = function(lhs, rhs, desc)
    vim.keymap.set("n", lhs, rhs, { desc = "Telescope | " .. desc })
  end

  local builtin = require("telescope.builtin")

  -- remaps native vim jumping o.O
  nmap("-", builtin.find_files, "[L]ook [f]or files")

  nmap("<leader>lf", builtin.live_grep, "[L]ook [f]or text")
  nmap("<leader>lw", builtin.grep_string, "[L]ook for [W]ord under cursor")
  nmap("<leader>sg", builtin.git_files, "[S]earch [G]it files")
  nmap("<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")
  nmap("<leader>sh", builtin.help_tags, "[S]earch [H]elp")

  nmap("<leader><space>", builtin.buffers, "[ ] existing buffers")
  nmap("<leader>?", builtin.oldfiles, "[?] Find recently opened files")

  nmap(
    "<leader>/",
    closure(
      builtin.current_buffer_fuzzy_find,
      require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
    ),
    "[/] Fuzzily search in current buffer"
  )
end

return M
