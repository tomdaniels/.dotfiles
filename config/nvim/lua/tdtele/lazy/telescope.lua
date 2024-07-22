return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    "nvim-telescope/telescope-ui-select.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },

  init = function()
    vim.keymap.set('n', '<leader>lf', require('telescope.builtin').find_files, { desc = '[L]ook for [F]iles' })
    vim.keymap.set('n', '<leader>lF', require('telescope.builtin').live_grep, { desc = '[L]ook [F]or text' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch [W]ord under cursor' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files, { desc = '[S]earch [G]it files' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })

    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend  = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })
  end,

  config = function()
    require('telescope').setup({
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
            winblend = 10
          }),
        }
      },
    })

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')

    require("telescope").load_extension("ui-select")

    vim.api.nvim_create_autocmd({ "ColorScheme" }, {
      group = tdtele,
      pattern = "*",
      callback = function()
        local config = vim.fn['gruvbox_material#get_configuration']()
        local colors = vim.fn['gruvbox_material#get_palette'](config.background, config.foreground,
          config.colors_override)

        local TelescopeColor = {
          TelescopeBorder         = { fg = colors.bg1[1] },

          TelescopePromptTitle    = { fg = colors.bg5[1] },
          TelescopePromptBorder   = { fg = colors.bg0[1] },
          TelescopePromptPrefix   = { fg = colors.orange[1] },

          TelescopeSelection      = { bold = true },
          TelescopeSelectionCaret = { fg = colors.orange[1] },
          TelescopeMatching       = { fg = colors.green[1], bold = true },
        }

        for hl, col in pairs(TelescopeColor) do
          vim.api.nvim_set_hl(0, hl, col)
        end
      end
    })
  end,
}
