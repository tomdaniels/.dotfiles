return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "jsonls",
      "ts_ls",
      "biome",
      "cssls",
      "tailwindcss",
      "graphql",
      "yamlls",
      "marksman",
      "lua_ls",
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
