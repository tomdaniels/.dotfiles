return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },

  init = function ()
    vim.keymap.set('n', '<C-p>',      require('telescope.builtin').find_files) -- shortcut
    vim.keymap.set('n', '<leader>lf', require('telescope.builtin').find_files,  { desc = '[L]ook [F]or (files)'         })
    vim.keymap.set('n', '<leader>lF', require('telescope.builtin').live_grep,   { desc = '[L]ook [F]or (text in files)' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch [W]ord under cursor' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').git_files,   { desc = '[S]earch [G]it files'         })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics'       })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags,   { desc = '[S]earch [H]elp',             })

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
        initial_mode = "normal",
        path_display = { "truncate" },
        file_ignore_patterns = { "node_modules", ".git" },
        layout_config = {
          horizontal = {
            preview_width = 0.6,
            results_width = 0.4,
          },
          width = 0.90,
          preview_cutoff = 0,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        }
      },
    })

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
