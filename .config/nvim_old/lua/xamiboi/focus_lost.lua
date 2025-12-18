-- Group for focus-based UI toggling
local timer = vim.loop.new_timer()

vim.api.nvim_create_autocmd("FocusGained", {
    pattern = "*",
    callback = function()
        timer:stop()
        timer:start(10, 0, vim.schedule_wrap(function() -- default value was 100ms
            --      vim.wo.cursorline = true
            vim.wo.relativenumber = true
            vim.wo.number = true
            --      vim.api.nvim_set_hl(0, "Normal", { bg="#08090d"})
            --      vim.diagnostic.config({ virtual_text = true, signs = true })
            vim.diagnostic.config({
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN]  = "",
                        [vim.diagnostic.severity.HINT]  = "",
                        [vim.diagnostic.severity.INFO]  = "",
                    },
                },
                virtual_text = {
                prefix = function(diagnostic)
                    local icons = {
                        [vim.diagnostic.severity.ERROR] = "",
                        [vim.diagnostic.severity.WARN]  = "",
                        [vim.diagnostic.severity.HINT]  = "",
                        [vim.diagnostic.severity.INFO]  = "",
                    }
                    return icons[diagnostic.severity] or "●"
                end,
                spacing = 4, -- Optional: space between icon and text
            },

            })
        end))
    end,
})

vim.api.nvim_create_autocmd("FocusLost", {
    pattern = "*",
    callback = function()
        timer:stop()
        timer:start(10, 0, vim.schedule_wrap(function() -- default value was 100ms
            --      vim.wo.cursorline = false
            vim.wo.relativenumber = false
            vim.wo.number = false
            --      vim.api.nvim_set_hl(0, "Normal", { bg="#000000"})
            vim.diagnostic.config({ 
                virtual_text = false, 
                signs = false,
            })
        end))
    end,
})

-- Define highlight groups
--vim.cmd("highlight ActiveWindow guibg=#050505")
--vim.cmd("highlight InactiveWindow guibg=#050505")
---- Apply highlight when window focus changes
--vim.api.nvim_create_autocmd("WinEnter", {
--  callback = function()
--    vim.cmd("setlocal winhighlight=Normal:ActiveWindow")
--    vim.wo.cursorline = true
--    vim.wo.relativenumber = true
--    vim.wo.number = true
--  end,
--})
--
--vim.api.nvim_create_autocmd("WinLeave", {
--  callback = function()
--    vim.cmd("setlocal winhighlight=Normal:InactiveWindow")
--    vim.wo.cursorline = false
--    vim.wo.relativenumber = false
--    vim.wo.number = false
--  end,
--})



-- for tmux unactive windows
-- and add this line of code in tmux.conf  set -g focus-events on
-- uncomment down lines of code of you don't do to much browser or tmux movement
-- this will helpful

-- works fine but this one go shaky when i come back to tmux
--vim.api.nvim_create_autocmd("FocusGained", {
--  pattern = "*",
--  callback = function()
--    vim.wo.cursorline = true
--    vim.wo.relativenumber = true
--        vim.diagnostic.config({ virtual_text = true, signs=  true })
--    vim.wo.number = true
--  end,
--})
--
--vim.api.nvim_create_autocmd("FocusLost", {
--  pattern = "*",
--  callback = function()
--    vim.wo.cursorline = false
--    vim.wo.relativenumber = false
--        vim.diagnostic.config({ virtual_text = false, signs=  false })
--    vim.wo.number = false
--  end,
--})
