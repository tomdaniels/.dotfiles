require"startup".create_mappings({
})

require("startup").setup({
  theme = "startify",
  options = {
    mapping_keys = true,

    cursor_column = 0.5,
    disable_statuslines = true,
    paddings = {1,2},
  },
  mappings = {
    execute_command = "<CR>",
    open_file = "o",
    open_file_split = "<c-o>",
    open_section = "<TAB>",
    open_help = "?",
  }
})

