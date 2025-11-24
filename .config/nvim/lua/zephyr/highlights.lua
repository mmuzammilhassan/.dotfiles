-- lua/xamiboi/highlights.lua
local M = {}

function M.setup()
  -- Cursorline & colorcolumn
  vim.api.nvim_set_hl(0, "cursorline", { bg = "#eae2e3" })
  vim.api.nvim_set_hl(0, "colorcolumn", { bg = "#eae2e3" })

  -- Example tweaks
  -- vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#388eb0" })
  -- vim.api.nvim_set_hl(0, "Comment", { italic = true, fg = "#908caa" })
end

return M

