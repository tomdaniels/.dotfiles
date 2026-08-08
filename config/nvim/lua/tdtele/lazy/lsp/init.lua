return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "j-hui/fidget.nvim",
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
    "hrsh7th/cmp-nvim-lsp",
  },

  config = function()
    require("fidget").setup({})
    require("tdtele.lazy.lsp.diagnostic")

    vim.diagnostic.config({
      float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })

    local lsp_keymaps = require("tdtele.lazy.lsp.keymaps")
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client then
          client.server_capabilities.semanticTokensProvider = nil
        end

        lsp_keymaps.on_attach(args)
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local servers = require("tdtele.lazy.lsp.servers")

    for server_name, server in pairs(servers) do
      server.capabilities = capabilities
      vim.lsp.config(server_name, server)
    end
  end,
}
