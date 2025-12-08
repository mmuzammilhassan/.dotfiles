-- THIS IS WHY I GET BLINKING CURSOR
--vim.opt.guicursor = ""

vim.opt.guicursor = {
    "n-v-c:block-blinkon200-blinkoff200", -- Normal, visual, commond mode: blinking block cursor
    "i-ci:block-blinkon0-blinkoff0",      -- insert, commond insert mode: solid block cursor (no blinking)
    "v-ci:block-blinkon0-blinkoff0",      -- visual, commond visual mode: solid block cursor (no blinking)
    "r-cr:block-blinkon0-blinkoff0",      --replace mode: solid block cursor (no blinking)
}

-- vim.opt.guicursor = {
--     -- Normal, Visual, Command, Operator-pending: Blinking Block
--     "n-v-c-sm:block-blinkwait700-blinkoff400-blinkon250",
--
--     -- Insert, Command-line Insert: Blinking Vertical Bar (25% width)
--     "i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250",
--
--     -- Replace, Virtual Replace: Blinking Underscore (20% height)
--     "r-cr-o:hor20-blinkwait700-blinkoff400-blinkon250",
-- }

-- vim.opt.guicursor = {
--     -- Normal mode: Blinking Block
--     "n-v-c-sm:block-blinkwait700-blinkoff400-blinkon250",
--
--     -- Insert mode: Solid Vertical Bar (No blink)
--     "i-ci-ve:ver25",
--
--     -- Replace mode: Solid Underscore (No blink)
--     "r-cr-o:hor20",
-- }
