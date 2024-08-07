return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local ts_formatters = { "biome-check", "prettier", "prettierd", "biome", stop_after_first = true }

    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        typescript = ts_formatters,
        typescriptreact = ts_formatters,
        json = ts_formatters,
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
