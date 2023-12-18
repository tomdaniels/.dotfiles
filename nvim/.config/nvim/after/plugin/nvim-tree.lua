-- disable netrw on init
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 75,
    adaptive_size = false,
    side = "right",
    preserve_window_proportions = true,
  },
  filters = {
    dotfiles = true,
  },
  actions = {
    open_file = {
      quit_on_open = false,
      resize_window = true,
    },
  },

  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = false,
  },
  git = {
    enable = true,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  renderer = {
    root_folder_label = false,
    highlight_git = true,
    highlight_opened_files = "none",
    group_empty = true,

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },

      glyphs = {
        default = "󰈚",
        symlink = "%",
        folder = {
          default = "::",
          empty = "_",
          empty_open = "_",
          open = "*",
          symlink = "%",
          symlink_open = "_",
          arrow_open = "➜",
          arrow_closed = "➜",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
})

vim.keymap.set("n", "<leader>te", ":NvimTreeToggle<CR>", { desc = "[T]ree [E]xplore" })
vim.keymap.set("n", "<leader>tf", ":NvimTreeFocus<CR>", { desc = "[T]ree [F]ocus" })
vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>") -- shortcut (files)
