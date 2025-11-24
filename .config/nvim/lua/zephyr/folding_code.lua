-- go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)

    if mark[1] > 0 and mark[1] <= lcount then
      -- reset to column 0 to avoid "out of range" errors
      pcall(vim.api.nvim_win_set_cursor, 0, { mark[1], 0 })
    end
  end,
})

---- Enable spell checking for certain file types
--api.nvim_create_autocmd(
--    { "BufRead", "BufNewFile" },
--    -- { pattern = { "*.txt", "*.md", "*.tex" }, command = [[setlocal spell<cr> setlocal spelllang=en,de<cr>]] }
--    {
--        pattern = { "*.txt", "*.md", "*.tex" },
--        callback = function()
--            vim.opt.spell = true
--            vim.opt.spelllang = "en"
--        end,
--    }
--)

-- Highlight on yank
--api.nvim_create_autocmd("TextYankPost", {
--    callback = function()
--        vim.highlight.on_yank()
--    end,
--})

-- this is working but i use leader+nf
-- MINIMAL SESSION-ONLY TRACKING OF NETRW CURSOR
--local last_netrw_pos = {}
--
--local netrw_cursor = {}
--
--vim.api.nvim_create_autocmd("BufLeave", {
--  callback = function()
--    if vim.bo.filetype == "netrw" then
--      netrw_cursor[vim.api.nvim_buf_get_name(0)] = vim.api.nvim_win_get_cursor(0)
--    end
--  end,
--})
--
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "netrw",
--  callback = function()
--    local name = vim.api.nvim_buf_get_name(0)
--    local pos = netrw_cursor[name]
--    if pos then
--      vim.defer_fn(function()
--        if pos[1] <= vim.api.nvim_buf_line_count(0) then
--          vim.api.nvim_win_set_cursor(0, pos)
--        end
--      end, 10)
--    end
--  end,
--})

-- Table to store netrw cursor positions per directory
--
--local netrw_positions = {}
--
---- Save position when leaving a netrw buffer
--vim.api.nvim_create_autocmd("BufWinLeave", {
--  pattern = "*",
--  callback = function()
--    if vim.bo.filetype == "netrw" then
--      local dir = vim.fn.expand("%:p")
--      local pos = vim.api.nvim_win_get_cursor(0)
--      netrw_positions[dir] = pos
--    end
--  end,
--})
--
---- Restore position when entering a netrw buffer
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "netrw",
--  callback = function()
--    vim.defer_fn(function()
--      local dir = vim.fn.expand("%:p")
--      local pos = netrw_positions[dir]
--      if pos then
--        pcall(vim.api.nvim_win_set_cursor, 0, pos)
--      end
--    end, 10)  -- small delay to let netrw render
--  end,
--})
--

-- FOLDING CODE AND SAVE THEM
--vim.opt.foldmethod = "manual"  -- Important!
--vim.opt.viewoptions:remove("options")
--vim.opt.viewoptions:append({ "folds", "cursor", "curdir" })
--vim.api.nvim_create_augroup("remember_folds", { clear = true })
--vim.api.nvim_create_autocmd("BufWinLeave", {
--  pattern = "*",
--  command = "silent! mkview",
--  group = "remember_folds",
--})
--
--vim.api.nvim_create_autocmd("BufWinEnter", {
--  pattern = "*",
--  command = "silent! loadview",
--  group = "remember_folds",
--})


--VIM/NEOVIM FOLDING CHEATSHEET
--Creating and deleting folds
--zf – Create a fold (you can give it a motion like zf} for fold till end of paragraph, or visually select and then zf).
--zd – Delete the fold at the cursor.
--zD – Delete all folds in the current line.
--zE – Eliminate (delete) all folds in the file.

--Opening folds
--zo – Open the fold under the cursor.
--zO – Open all nested folds under the cursor.
--zr – Reduce fold level (open more folds across the file).
--zR – Open all folds everywhere.

--Closing folds
--zc – Close the fold under the cursor.
--zC – Close all nested folds under the cursor.
--zm – Increase fold level (close more folds across the file).
--zM – Close all folds everywhere.

--Toggling folds
--za – Toggle the fold under the cursor (open if closed, close if open).
--zA – Toggle recursively (open/close all folds under cursor).

--Misc
--zi – Toggle folding on/off entirely (show everything unfolded).
--
