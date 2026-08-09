return {
  "catgoose/nvim-colorizer.lua",
  event = "BufReadPre",
  opts = {
    options = {
      parsers = {
        css = true,
        css_fn = true,
        tailwind = { enable = true },
      },
    },
  },
}
