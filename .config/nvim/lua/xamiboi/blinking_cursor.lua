-- THIS IS WHY I GET BLINKING CURSOR
--vim.opt.guicursor = ""
vim.opt.guicursor = {
    "n-v-c:block-blinkon200-blinkoff200", -- Normal, visual, commond mode: blinking block cursor
    "i-ci:block-blinkon0-blinkoff0",      -- insert, commond insert mode: solid block cursor (no blinking)
    "v-ci:block-blinkon0-blinkoff0",      -- visual, commond visual mode: solid block cursor (no blinking)
    "r-cr:block-blinkon0-blinkoff0",      --replace mode: solid block cursor (no blinking)
}
