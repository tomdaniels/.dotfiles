return {
  {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "folke/noice.nvim", event = "VeryLazy", opts = {
      messages = { enabled = false } }
  },
  { "sainnhe/gruvbox-material" },
  { 'nvim-lualine/lualine.nvim', opts = { } },
  { 'rhysd/git-messenger.vim' },
  { "f-person/git-blame.nvim" },
  { "nvim-treesitter/playground" },
  { "mbbill/undotree" },
  { "theprimeagen/harpoon" },
  { "wakatime/vim-wakatime" },
  { "neovim/nvim-lspconfig" },
  { "neoclide/coc.nvim", branch = "release"},
  { "nvim-tree/nvim-tree.lua" },
  { "startup-nvim/startup.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {}},
  { "terrortylor/nvim-comment" },
  { "MunifTanjim/nui.nvim" },
  { "rcarriga/nvim-notify" },
  { "arthurxavierx/vim-caser" },
}

