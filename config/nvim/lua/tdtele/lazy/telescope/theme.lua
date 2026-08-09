local M = {}

M.setup = function()
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
end

return M
