return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      "c",
      "cpp",
      "go",
      "lua",
      "python",
      "rust",
      "javascript",
      "tsx",
      "typescript",
      "css",
      "scss",
      "vimdoc",
      "vim",
      "jsdoc",
      "bash",
      "templ",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
