return {
  jsonls = {},
  ts_ls = {},
  biome = {},
  cssls = {},
  tailwindcss = {
    settings = {
      tailwindCSS = {
        classFunctions = { "tw", "cn", "cx", "cva" },
      },
    },
  },
  graphql = {
    root_dir = require("lspconfig.util").root_pattern(".graphqlconfig", ".graphqlrc", "package.json"),
    flags = { debounce_text_changes = 150 },
  },
  yamlls = {},
  marksman = {},
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = "Lua 5.1" },
        completion = { callSnippet = "Replace" },
        diagnostics = {
          globals = {
            "vim",
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
  },
}
