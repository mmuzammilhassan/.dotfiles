return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      filetypes = { "*" },
      user_default_options = {
        names = false,
        RRGGBBAA = true,
        rgb_fn = true,
        mode = "background",
      },
    })
  end,
}
