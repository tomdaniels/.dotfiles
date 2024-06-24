return {
  "f-person/git-blame.nvim",
  config = function ()
    ---@diagnostic disable: missing-fields
    require('gitblame').setup({ enabled = true })
    ---@diagnostic enable: missing-fields
  end
}
