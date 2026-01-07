return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()

    -- 1. Accept Full Suggestion: Right Arrow
    -- (Triggers via your Mod+L or Mod+H, however you set it)
    vim.keymap.set("i", "<Right>", neocodeium.accept)

    -- 2. Accept Just One Word: Shift + Right Arrow
    -- (Triggers via Shift + Mod + L)
    vim.keymap.set("i", "<S-Right>", neocodeium.accept_word)

    -- 3. Accept Line: Left Arrow
    vim.keymap.set("i", "<Left>", neocodeium.accept_line)

    -- 4. Cycle Suggestions: Up and Down Arrows
    -- (Triggers via your Mod+K and Mod+J)
    -- This allows you to browse alternatives without leaving home row.
    vim.keymap.set("i", "<Down>", neocodeium.cycle_or_complete)
    vim.keymap.set("i", "<Up>", function() neocodeium.cycle(-1) end)
  end,
}
