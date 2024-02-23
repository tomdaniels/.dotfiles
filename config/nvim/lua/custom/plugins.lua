return {
  {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "folke/noice.nvim", event = "VeryLazy",
      opts = {
        messages = { enabled = false },
        notify = { enabled = false }
      }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
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
  { "startup-nvim/startup.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {}},
  { "terrortylor/nvim-comment" },
  { "MunifTanjim/nui.nvim" },
  { "rcarriga/nvim-notify" },
  { "arthurxavierx/vim-caser" },
  { 'nvim-tree/nvim-web-devicons' },
}

