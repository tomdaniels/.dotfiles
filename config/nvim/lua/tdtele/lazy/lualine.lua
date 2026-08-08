return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = false,
        theme = "gruvbox-material",
        component_separators = { left = "", right = "|" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          -- attempting to stop lualine painting on telsecope popups
          statusline = { "TelescopePrompt", "TelescopeResults" },
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "filename" },
        lualine_z = { "location" },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
