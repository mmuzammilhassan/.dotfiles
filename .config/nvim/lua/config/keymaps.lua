local opts = { noremap = true, silent = true }
-- local map = vim.keymap.set

-- this is custom for php {{ }}
vim.keymap.set("n", ",h", "a{{ $ }}<Esc>3ha", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>nr", "<cmd>set nu! rnu!<cr>")

-- this is my old keymaps/remaps
-- Keep cursor centered when scrolling
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- not sure how to use this
vim.keymap.set("n", "*", "*zzv", opts)
vim.keymap.set("n", "#", "#zzv", opts)
vim.keymap.set("n", "g*", "g*zz", opts)
vim.keymap.set("n", "g#", "g#zz", opts)

vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- this is going to get me cancelled
--vim.keymap.set("i", "<c-c>", "<esc>")

vim.keymap.set("n", "q", "<nop>")

--tmux-sessionizer alt+f
vim.keymap.set("n", "<m-f>", "<cmd>silent !tmux neww tmux-sessionizer<cr>")
vim.keymap.set("n", "<leader>fa", vim.lsp.buf.format)

-- this is using blade-formatter
--vim.api.nvim_set_keymap("n", "<leader>fb", ":!blade-formatter %<cr>", { noremap = true })

vim.keymap.set("n", "<c-k>", "<cmd>cnext<cr>zz")
vim.keymap.set("n", "<c-j>", "<cmd>cprev<cr>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<cr>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<cr>zz")

vim.keymap.set("n", "<leader>r", [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gi<left><left><left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<cr>", { silent = true })

--vim.keymap.set( "n", "<leader>ee", "oif err != nil {<cr>}<esc>oreturn err<esc>")

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/dotfiles_1/.config/nvim/lua/xamiboi/lazy.lua<cr>");
vim.keymap.set("n", "<leader>mr", "<cmd>cellularautomaton make_it_rain<cr>");

--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)

-- Custom commands
--vim.keymap.set("n", "W", ":write<CR>", { silent = true, desc = "Save file" })
--vim.keymap.set("n", "Wq", ":wq<CR>", { silent = true, desc = "wq" })

-- restore original `s` behavior
vim.keymap.set("n", "s", "s", { noremap = true, silent = true })
vim.keymap.set("n", "S", "S", { noremap = true, silent = true })

-- keymaps for resize windows with arrow keys
vim.keymap.set('n', '<Up>', '<cmd>resize +1<cr>', { desc = "Increase Window Height" })
vim.keymap.set('n', '<Down>', '<cmd>resize -1<cr>', { desc = "Increase Window Height" })
vim.keymap.set('n', '<Right>', '<cmd>vertical resize +5<cr>', { desc = "Increase Window Height" })
vim.keymap.set('n', '<Left>', '<cmd>vertical resize -5<cr>', { desc = "Increase Window Height" })

-- Panes resizing
--vim.keymap.set("n", "+", ":vertical resize +5<CR>")
--vim.keymap.set("n", "_", ":vertical resize -5<CR>")
--vim.keymap.set("n", "=", ":resize +5<CR>")
--vim.keymap.set("n", "-", ":resize -5<CR>")

-- Move selected line / block of text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Fast saving
vim.keymap.set("n", "<leader>w", ":write!<CR>", { silent = true, desc = "Save file" })
vim.keymap.set("n", "<leader>x", ":x<CR>", { silent = true, desc = "Save & Exit file" })
vim.keymap.set("n", "<leader>q", ":q!<CR>", opts)

-- Remap for dealing with visual line wraps
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- paste over currently selected text without yanking it
vim.keymap.set("v", "p", '"_dp')
vim.keymap.set("v", "P", '"_dP')

-- copy everything between { and } including the brackets
-- p puts text after the cursor,
-- P puts text before the cursor.
vim.keymap.set("n", "YY", "va{Vy", opts)

-- Move line on the screen rather than by line in the file
-- vim.keymap.set("n", "j", "gj", opts)
-- vim.keymap.set("n", "k", "gk", opts)

-- Exit on jj and jk
-- vim.keymap.set("i", "jj", "<ESC>", opts)
-- vim.keymap.set("i", "jk", "<ESC>", opts)

-- Move to start/end of line
vim.keymap.set({ "n", "x", "o" }, "H", "^", opts)
vim.keymap.set({ "n", "x", "o" }, "L", "g_", opts)

-- Navigate buffers
-- vim.keymap.set("n", "<Right>", ":bnext<CR>", opts)
-- vim.keymap.set("n", "<Left>", ":bprevious<CR>", opts)

-- Panes resizing
vim.keymap.set("n", "+", ":vertical resize +5<CR>")
vim.keymap.set("n", "_", ":vertical resize -5<CR>")
vim.keymap.set("n", "=", ":resize +5<CR>")
vim.keymap.set("n", "-", ":resize -5<CR>")

-- Map enter to ciw in normal mode
-- vim.keymap.set("n", "<CR>", "ciw", opts)  -- Commented out: This overwrites word on Enter - too disruptive
-- vim.keymap.set("n", "<BS>", "ci", opts)   -- Commented out: This changes text on Backspace - too disruptive

-- map ; to resume last search
-- map("n", ";", "<cmd>Telescope resume<cr>", opts)

-- search current buffer
-- vim.keymap.set("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>", opts)

-- Split line with X
vim.keymap.set("n", "X", ":keeppatterns substitute/\\s*\\%#\\s*/\\r/e <bar> normal! ==^<cr>", { silent = true })

-- ctrl + x to cut full line
-- vim.keymap.set("n", "<C-x>", "dd", opts)

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", opts)

-- write file in current directory
-- :w %:h/<new-file-name>
-- vim.keymap.set("n", "<C-n>", ":w %:h/", opts)

-- delete forward
-- w{number}dw
-- delete backward
-- w{number}db

vim.keymap.set("n", "<C-P>", ':lua require("config.utils").toggle_go_test()<CR>', opts)

-- Get highlighted line numbers in visual mode
vim.keymap.set("v", "<leader>ln", ':lua require("config.utils").get_highlighted_line_numbers()<CR>', opts)

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", opts)
