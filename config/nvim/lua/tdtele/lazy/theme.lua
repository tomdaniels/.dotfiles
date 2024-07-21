return {
  "sainnhe/gruvbox-material",
  config = function()
    vim.cmd [[ colorscheme gruvbox-material ]]
  end,

  init = function ()
    vim.api.nvim_create_autocmd({"ColorScheme"}, {
      group = tdtele,
      pattern = "*",
      callback = function ()
        vim.api.nvim_set_hl(0, "@tag.tsx", { link = "Yellow" })
        vim.api.nvim_set_hl(0, "@tag.builtin.tsx", { link = "Orange" })
        vim.api.nvim_set_hl(0, "@character.special.scss", { link = "Orange" })
        vim.api.nvim_set_hl(0, "@property.scss", { link = "Blue" })
        vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "Comment" })
      end
    })
  end
}
