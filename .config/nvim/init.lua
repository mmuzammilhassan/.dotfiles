-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- load your config
require("zephyr")

require("core.mason-path")
require("core.lsp")
require("core.statusline")
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.mason-verify")
require("config.health-check")
require("core.lazy")
