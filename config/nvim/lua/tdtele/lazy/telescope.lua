local function filenameFirst(_, path)
  local tail = require("telescope.utils").path_tail(path)

  -- Get the parent path (relative to the current directory)
  local parent = vim.fn.fnamemodify(path, ":.:h")
  if parent == "." then
    return tail
  end

  -- Split the parent path into components
  local components = {}
  for part in string.gmatch(parent, "[^/]+") do
    table.insert(components, part)
  end

  -- Truncate all but the last directory, except those starting with a capital letter
  for i = 1, #components - 1 do
    if not string.match(components[i], "^[A-Z]") then
      components[i] = string.sub(components[i], 1, 1) -- Truncate to the first character
    end
  end

  -- Reconstruct the parent path
  local truncated_parent = table.concat(components, "/")

  -- Format and return the result
  return string.format("%s\t\t%s", tail, truncated_parent)
end

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

  opts = function()
    return {
      pickers = {
        find_files = {
          path_display = filenameFirst,
        },
        lsp_references = {
          layout_strategy = "vertical",
          fname_width = 60,
          path_display = filenameFirst,
        },
      },
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "❯ ",
        layout_config = {
          horizontal = {
            preview_width = 0.6,
            results_width = 0.4,
          },
          width = 0.90,
          preview_cutoff = 0,
        },
        prompt_title = false,
        results_title = false,
        path_display = { "truncate" },
        file_ignore_patterns = { "node_modules", ".git/" },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
            winblend = 10,
          }),
        },
      },
    }
  end,

  init = function()
    local group = vim.api.nvim_create_augroup("td_telescope", { clear = true })

    vim.api.nvim_create_autocmd("ColorScheme", {
      group = group,
      pattern = "*",
      callback = function()
        local config = vim.fn["gruvbox_material#get_configuration"]()
        local colors =
          vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)

        local TelescopeColor = {
          TelescopeBorder = { fg = colors.bg1[1] },
          TelescopePromptTitle = { fg = colors.bg5[1] },
          TelescopePromptBorder = { fg = colors.bg0[1] },
          TelescopePromptPrefix = { fg = colors.orange[1] },
          TelescopeSelection = { bold = true },
          TelescopeSelectionCaret = { fg = colors.orange[1] },
          TelescopeMatching = { fg = colors.green[1], bold = true },
        }

        for hl, col in pairs(TelescopeColor) do
          vim.api.nvim_set_hl(0, hl, col)
        end
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = "TelescopeResults",
      callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
          vim.fn.matchadd("TelescopeParent", "\t\t.*$")
          vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
      end,
    })
  end,

  config = function(_, opts)
    require("telescope").setup(opts)
    pcall(require("telescope").load_extension, "fzf")

    require("telescope").load_extension("ui-select")

    local nmap = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { desc = "Telescope | " .. desc })
    end

    -- remaps native vim jumping o.O
    nmap("`", require("telescope.builtin").find_files, "[L]ook [f]or files")
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
  end,
}
