return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "BurntSushi/ripgrep",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },

  opts = {
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
  },

  init = function()
    vim.api.nvim_create_autocmd({ "ColorScheme" }, {
      group = vim.api.nvim_create_augroup("td_telescope", { clear = true }),
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
  end,

  config = function(_, opts)
    require("telescope").setup(opts)
    pcall(require("telescope").load_extension, "fzf")

    require("telescope").load_extension("ui-select")

    local nmap = function(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { desc = "Telescope | " .. desc })
    end

    nmap("<leader>lf", require("telescope.builtin").find_files, "[L]ook [f]or files")
    nmap("<leader>lF", require("telescope.builtin").live_grep, "[L]ook [F]or text")
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
