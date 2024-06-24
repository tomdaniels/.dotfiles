return {
  "prichrd/netrw.nvim",
  init = function ()
    vim.g.netrw_altfile = 1
  end,
  config = function ()
    require("netrw").setup({ use_devicons = true })

    -- focus netrw on previous file
    vim.keymap.set( "n", "-", ":Ex <bar> :sil! /<C-R>=expand(\"%:t\")<CR><CR>")
  end
}
