-- this is my own config for neovim
-- this down lines are my own configs

-- Custom commands
vim.api.nvim_create_user_command('W', 'w', {})
--vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
-- vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, nowait = true }) -- this is like for jj to Esa

---- NEOVIM TERMINAL CONFIG
--vim.api.nvim_create_autocmd('TermOpen', {
--    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
--    callback = function()
--        vim.api.number = false;
--        vim.api.relativenumber = false;
--        vim.api.wrap = false;
--    end,
--})
--
--local job_id = 0
--vim.keymap.set("n", "<space>st", function()
--    vim.cmd.vnew()
--    vim.cmd.term()
--    vim.cmd.wincmd("J")
--    vim.api.nvim_win_set_height(0, 5)
--
--    job_id = vim.bo.channel
--end)
--
--vim.keymap.set("n", "<space>example", function ()
--    --make
--    --go build, go test ./asduauh
--    vim.fn.chansend(job_id, {"ls -al\r\n"})
--end)

-- Key mappings
-- vim.api.nvim_set_keymap('n', 'J', '<nop>', { noremap = true, nowait = true })
-- vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, nowait = true })

-- keymaps for resize windows with arrow keys
vim.keymap.set('n', '<Up>', '<cmd>resize +1<cr>', { desc = "Increase Window Height" })
vim.keymap.set('n', '<Down>', '<cmd>resize -1<cr>', { desc = "Increase Window Height" })
vim.keymap.set('n', '<Right>', '<cmd>vertical resize +5<cr>', { desc = "Increase Window Height" })
vim.keymap.set('n', '<Left>', '<cmd>vertical resize -5<cr>', { desc = "Increase Window Height" })

-- lazygit command
--vim.keymap.set('n', '<leader>g', ':LazyGit<CR>', { noremap = true, silent = true })

-- this down lines are from primeagen i just copy

vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--vim.keymap.set("n", "<leader>pn", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
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

-- This is going to get me cancelled
--vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

--tmux-sessionizer Alt+f
vim.keymap.set("n", "<M-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>fa", vim.lsp.buf.format)

-- This is using blade-formatter
--vim.api.nvim_set_keymap("n", "<leader>fb", ":!blade-formatter %<CR>", { noremap = true })

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--vim.keymap.set( "n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/dotfiles/.config/nvim/lua/xamiboi/lazy.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)
