return {
    "L3MON4D3/LuaSnip",
    config = function ()
        local luasnip = require("luasnip")
        luasnip.log.set_loglevel("info")
        require("luasnip.loaders.from_lua").lazy_load({
            paths = { "~/.config/nvim/lua/tdtele/snippets" }
        })
        luasnip.setup({
            store_selection_keys = "<Tab>",
        })
        luasnip.filetype_extend("typescriptreact", { "typescript" })
    end
}
