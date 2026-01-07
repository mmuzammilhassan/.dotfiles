return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  config = function()
    local neocodeium = require("neocodeium")
    neocodeium.setup()
    
    -- Map <A-f> to accept the suggestion
    -- Note: Since you use 'st', make sure Alt key is mapped correctly, 
    -- otherwise <A-f> might trigger something else.
    vim.keymap.set("i", "<C-c>", neocodeium.accept)
    
    -- Cycle suggestions with Ctrl-w and Ctrl-b (optional but helpful)
    vim.keymap.set("i", "<C-w>", neocodeium.cycle_or_complete)
    vim.keymap.set("i", "<C-b>", function() neocodeium.cycle(-1) end) 
  end,
}
