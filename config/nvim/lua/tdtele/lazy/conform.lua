return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local ts_formatters = { "biome-check", "prettier", "prettierd", "biome", stop_after_first = true }

    require("conform").setup({
      formatters = {
        ["biome-check"] = {
          -- Prefer the project's own node_modules-pinned biome binary over
          -- whatever's on $PATH, so monorepo packages pinned to different
          -- biome versions each use their own, not a mismatched global one.
          command = function(self, ctx)
            local root = vim.fs.root(ctx.dirname, { "biome.json", "biome.jsonc" })
            if root then
              local bin = root .. "/node_modules/.bin/biome"
              if vim.fn.executable(bin) == 1 then return bin end
            end
            return "biome"
          end,
          stdin = true,
          args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
          cwd = require("conform.util").root_file({ "biome.json", "biome.jsonc" }),
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = ts_formatters,
        javascriptreact = ts_formatters,
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
