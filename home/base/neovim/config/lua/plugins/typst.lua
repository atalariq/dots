return {
  {
    "chomosuke/typst-preview.nvim",
    lazy = false,
    ft = "typst",
    version = "1.*",
    opts = {
      invert_colors = "never",
      follow_cursor = true,
      dependencies_bin = {
        ["tinymist"] = "tinymist",
        ["websocat"] = "websocat" },
    },
  },
}
