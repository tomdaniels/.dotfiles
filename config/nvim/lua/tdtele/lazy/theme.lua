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
        vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "Comment" })
      end
    })
  end
}
