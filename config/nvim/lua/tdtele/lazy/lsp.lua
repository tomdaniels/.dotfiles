local lsp_group = vim.api.nvim_create_augroup("lsp", { clear = true })
vim.api.nvim_create_autocmd("LspAttach", {
  group = lsp_group,
  callback = function(e)
    local nmap = function(keys, func, desc)
      if desc then
        desc = "LSP | " .. desc
      end

      vim.keymap.set("n", keys, func, { buffer = e.buf, desc = desc })
    end

    nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    nmap("gD", vim.lsp.buf.type_definition, "Type [D]efinition")
    nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

    nmap("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
    nmap("]d", vim.diagnostic.goto_next, "Go to next diagnostic message")
    nmap("<leader>e", vim.diagnostic.open_float, "Open floating diagnostic message")
    nmap("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")

    vim.api.nvim_buf_create_user_command(e.buf, "Format", function(_)
      vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })

    local vtsls = require("vtsls")
    nmap("<leader>tu", vtsls.commands.remove_unused_imports, "[T]ypescript Remove [U]nused Imports")
    nmap("<leader>ts", vtsls.commands.sort_imports, "[T]ypescript [S]ort Imports")
    nmap("<leader>tr", vtsls.commands.rename_file, "[T]ypescript [R]ename File")
    nmap("<leader>tR", vtsls.commands.restart_tsserver, "[T]ypescript [R]estart Server")
  end,
})

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
    "folke/neodev.nvim",
    "yioneko/nvim-vtsls",
  },

  config = function()
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities =
      vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

    require("neodev").setup()
    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "vtsls",
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,

        ["vtsls"] = function(e)
          local lspconfig = require("lspconfig")
          lspconfig.vtsls.setup({
            settings = {
              vtsls = {
                autoUseWorkspaceTsdk = true,
                init_options = { hostInfo = "neovim" },
                experimental = {
                  completion = {
                    enableServerSideFuzzyMatch = true,
                  },
                },
              },
              typescript = {
                format = {
                  enable = false,
                },
              },
            },
          })
        end,

        ["gopls"] = function()
          vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            group = lsp_group,
            pattern = "*.go",
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })

          local lspconfig = require("lspconfig")
          lspconfig.gopls.setup({
            capabilities = capabilities,
            settings = {
              gopls = {
                analyses = { unusedparams = true },
                staticcheck = true,
                gofumpt = true,
              },
            },
          })
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = {
                    "bit",
                    "vim",
                    "it",
                    "describe",
                    "before_each",
                    "after_each",
                    "s",
                    "sn",
                    "isn",
                    "t",
                    "i",
                    "f",
                    "c",
                    "d",
                    "r",
                  },
                },
              },
            },
          })
        end,
      },
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    ---@diagnostic disable: missing-fields
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
      }),
    })
    ---@diagnostic enable: missing-fields

    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })
  end,
}
