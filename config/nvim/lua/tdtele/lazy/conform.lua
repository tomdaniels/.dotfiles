return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local web_formatters = { "biome-check", "prettier", "prettierd", "biome", stop_after_first = true }

    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        typescript = web_formatters,
        typescriptreact = web_formatters,
        javascript = web_formatters,
        javascriptreact = web_formatters,
        json = web_formatters,
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
