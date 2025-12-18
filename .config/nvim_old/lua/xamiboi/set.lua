-- THIS IS NEOVIM SPELL SUPPORT
--vim.opt.spell = true
--vim.opt.spelllang = "en"

--KEYBINDINGS FOR SPELL CHECKING:
--[s → Go to the previous misspelled word.
--]s → Go to the next misspelled word.
--z= → Show spelling suggestions for the current word.
--zg → Add the word to your dictionary.
--zw → Mark the word as incorrect.

-- COLORSCHEME
--    vim.cmd("syntax enable")
--    vim.cmd("filetype plugin indent on")
--    vim.opt.termguicolors = true
--    vim.cmd("colorscheme wildcharm")  -- try also wildcharm, shine, desert, peachpuff, ron, habamax, sorbet, wildcharm
--    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--


-- THIS DOWN LINES ARE FROM PRIMEAGEN
-- Navigation vim + tmux panes better
--vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')


-- BASIC NEOVIM SETUP
vim.opt.number = true
vim.opt.relativenumber = true

-- CURSORLINE THINGS
vim.opt.cursorline = false
--vim.opt.cursorcolumn = false

--Source: :help 'statuscolumn' in Neovim
vim.opt.statuscolumn = " %l %=%s" -- this is awesome but not perfect
--vim.opt.statuscolumn = "%l    " -- this is awesome but not perfect
--vim.opt.statuscolumn = " %l %=" -- this is awesome but not perfect


vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

--vim.o.cmdheight = 0
vim.o.showmode = true
--vim.opt.lazyredraw = true
--vim.opt.timeoutlen = 300

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.updatetime = 1

vim.opt.scrolloff = 9
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.colorcolumn = "80"

vim.opt.clipboard = "unnamedplus"
vim.opt.clipboard = "unnamed"
