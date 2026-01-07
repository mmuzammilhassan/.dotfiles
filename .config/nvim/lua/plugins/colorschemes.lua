return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    lazy = false,
    enabled= true,
    config = function()
      require("rose-pine").setup({
        variant = "moon", -- options: "dawn", "moon", "main"
        dark_variant = "moon",
        styles = { transparency = true }
      })

      vim.cmd("colorscheme rose-pine")
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "#0a0410" })
      --      vim.api.nvim_set_hl(0, "cursorline", { bg = "#eae2e3" })
      --      vim.api.nvim_set_hl(0, "colorcolumn", { bg = "#eae2e3" })
      vim.api.nvim_set_hl(0, "cursorline", { bg = "#1a162e" })
      vim.api.nvim_set_hl(0, "colorcolumn", { bg = "#1a162e" })
      -- vim.api.nvim_set_hl(0, "statusline", { bg = "#1a162e", fg = "#8f8ba9" })
      -- vim.api.nvim_set_hl(0, "cursorline", { bg = "#393552" })
      -- vim.api.nvim_set_hl(0, "colorcolumn", { bg = "#393552" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0a0410" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#09030f" })
    end
  }
}

--         bold_vert_split = false,
--         dim_nc_background = false,
--         disable_background = false,
--         disable_float_background = false,
--         disable_italics = true,
--
--         highlight_groups = {
--           -- Completion menu
--           Pmenu = { bg = "surface", fg = "text" },
--           PmenuSel = { bg = "highlight_med", fg = "text" },
--           PmenuSbar = { bg = "surface" },
--           PmenuThumb = { bg = "highlight_med" },
--
--           -- Floating windows
--           NormalFloat = { bg = "surface" },
--           FloatBorder = { fg = "highlight_med", bg = "surface" },
--           FloatTitle = { fg = "text", bg = "surface" },
--
--           -- Blink.cmp
--           BlinkCmpMenu = { bg = "surface", fg = "text" },
--           BlinkCmpMenuBorder = { bg = "surface", fg = "highlight_med" },
--           BlinkCmpMenuSelection = { bg = "highlight_low", fg = "text" },
--           BlinkCmpLabelDeprecated = { fg = "muted", strikethrough = true },
--           BlinkCmpLabelDescription = { fg = "muted" },
--           BlinkCmpKind = { fg = "rose" },
--           BlinkCmpGhostText = { fg = "muted", italic = true },
--
--           -- Snacks.nvim
--           SnacksPicker = { bg = "base" },
--           SnacksPickerBorder = { bg = "base", fg = "highlight_low" },
--           SnacksPickerPreview = { bg = "base" },
--           SnacksPickerPreviewBorder = { bg = "base", fg = "base" },
--           SnacksPickerPreviewTitle = { fg = "base", bg = "pine" },
--           SnacksPickerSelected = { bg = "highlight_low" },
--
--           SnacksNotifierBorder = { bg = "surface", fg = "highlight_med" },
--           SnacksNotifierTitle = { fg = "text", bold = true },
--
--           -- LSP/UI
--           CursorLineNr = { fg = "text" },
--           LineNr = { fg = "muted" },
--           VertSplit = { fg = "highlight_med" },
--           LspInfoBorder = { fg = "highlight_med", bg = "surface" },
--
--           -- Indent guides
--           IblIndent = { fg = "highlight_low" },
--           IblScope = { fg = "highlight_med" },
--
--           -- Git
--           GitSignsChange = { fg = "rose" },
--
--           -- Treesitter basic
--           ["@function"] = { fg = "pine", bold = true },
--           ["@type"] = { fg = "gold", bold = true },
--           ["@variable"] = { fg = "text" },
--           ["@keyword"] = { fg = "rose" },
--           ["@string"] = { fg = "foam" },
--           ["@number"] = { fg = "iris" },
--         },
--       })
--
--       vim.cmd("colorscheme rose-pine")
--     end,
--   },
--
--   -- KEEP ANY OTHER THEMES IF YOU WANT THEM DISABLED OR OPTIONAL:
--
--   {
--     "sainnhe/gruvbox-material",
--     enabled = false,
--   },
--
--   {
--     "catppuccin/nvim",
--     enabled = false,
--   },
--
--   {
--     "RRethy/base16-nvim",
--     enabled = false,
--   },
--
--   {
--     "adibhanna/forest-night.nvim",
--     enabled = false,
--   },
--
--   {
--     "AlexvZyl/nordic.nvim",
--     enabled = false,
--   },
--
--   {
--     "projekt0n/github-nvim-theme",
--     enabled = false,
--   },
-- }
