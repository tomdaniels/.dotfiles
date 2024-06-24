return {
  "rhysd/git-messenger.vim",
  init = function ()
    vim.g.git_messenger_max_popup_width = 80
    vim.g.git_messenger_floating_win_opts = { border = "rounded" }
  end
}
