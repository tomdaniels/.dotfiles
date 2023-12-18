return {
  { 'sainnhe/gruvbox-material' },
  { 'f-person/git-blame.nvim' },
  { 'nvim-treesitter/playground' },
  { 'mbbill/undotree' },
  { 'theprimeagen/harpoon' },
  { 'wakatime/vim-wakatime' },
  { 'neovim/nvim-lspconfig' },
  { 'neoclide/coc.nvim', branch = 'release'},
  { 'nvim-tree/nvim-tree.lua' },
  {
    "jose-elias-alvarez/buftabline.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
    config = function() require("buftabline").setup {} end
  },
  { "startup-nvim/startup.nvim" },
  { "norcalli/nvim-colorizer.lua" }
}


