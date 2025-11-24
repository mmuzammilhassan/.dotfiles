-- Group for focus-based UI toggling
-- timer for debouncing
-- last config
------   local timer = vim.loop.new_timer()
------   
------   -- Focus gained
------   vim.api.nvim_create_autocmd("FocusGained", {
------     pattern = "*",
------     callback = function()
------       timer:stop()
------       timer:start(10, 0, vim.schedule_wrap(function()
------         vim.wo.relativenumber = true
------         vim.wo.number = true
------   
------         vim.diagnostic.config({
------           signs = {
------             text = {
------               [vim.diagnostic.severity.ERROR] = "󰅚 ",
------               [vim.diagnostic.severity.WARN]  = "󰀪 ",
------               [vim.diagnostic.severity.INFO]  = "󰋽 ",
------               [vim.diagnostic.severity.HINT]  = "󰌶 ",
------             },
------             numhl = {
------               [vim.diagnostic.severity.ERROR] = "ErrorMsg",
------               [vim.diagnostic.severity.WARN]  = "WarningMsg",
------             },
------           },
------           virtual_text = {
------             prefix = function(diagnostic)
------               local icons = {
------                 [vim.diagnostic.severity.ERROR] = "󰅚 ",
------                 [vim.diagnostic.severity.WARN]  = "󰀪 ",
------                 [vim.diagnostic.severity.INFO]  = "󰋽 ",
------                 [vim.diagnostic.severity.HINT]  = "󰌶 ",
------               }
------               return icons[diagnostic.severity] or "●"
------             end,
------             spacing = 4,
------           },
------         })
------       end))
------     end,
------   })
------   
------   -- Focus lost
------   vim.api.nvim_create_autocmd("FocusLost", {
------     pattern = "*",
------     callback = function()
------       timer:stop()
------       timer:start(10, 0, vim.schedule_wrap(function()
------         vim.wo.relativenumber = false
------         vim.wo.number = false
------         vim.diagnostic.config({
------           virtual_text = false,
------           signs = false,
------         })
------       end))
------     end,
------   })
------   
------   -- baseline diagnostic setup
------   vim.diagnostic.config({
------     virtual_text = true,
------     underline = true,
------     update_in_insert = false,
------     severity_sort = true,
------     float = {
------       border = "rounded",
------       source = true,
------     },
------     signs = {
------       text = {
------         [vim.diagnostic.severity.ERROR] = "󰅚 ",
------         [vim.diagnostic.severity.WARN]  = "󰀪 ",
------         [vim.diagnostic.severity.INFO]  = "󰋽 ",
------         [vim.diagnostic.severity.HINT]  = "󰌶 ",
------       },
------       numhl = {
------         [vim.diagnostic.severity.ERROR] = "ErrorMsg",
------         [vim.diagnostic.severity.WARN]  = "WarningMsg",
------       },
------     },
------   })

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


local timer = vim.loop.new_timer()

-- Focus gained
vim.api.nvim_create_autocmd("FocusGained", {
    pattern = "*",
    callback = function()
        timer:stop()
        timer:start(10, 0, vim.schedule_wrap(function()
            vim.wo.number = true
            vim.wo.relativenumber = true
            --vim.wo.cursorline = true
            vim.diagnostic.config({
                virtual_text = true,
                underline = true,
                update_in_insert = true,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = true,
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "󰅚",
                        [vim.diagnostic.severity.WARN]  = "󰀪",
                        [vim.diagnostic.severity.INFO]  = "󰋽",
                        [vim.diagnostic.severity.HINT]  = "󰌶",
                    },
                    numhl = {
                        [vim.diagnostic.severity.ERROR] = "ErrorMsg",
                        [vim.diagnostic.severity.WARN]  = "WarningMsg",
                        [vim.diagnostic.severity.INFO] = "InfoMsg",
                        [vim.diagnostic.severity.HINT]  = "HintMsg",
                    },
                },
            })
        end))
    end,
})

-- Focus lost
vim.api.nvim_create_autocmd("FocusLost", {
  pattern = "*",
  callback = function()
    timer:stop()
    timer:start(10, 0, vim.schedule_wrap(function()
      vim.wo.number = false
      vim.wo.relativenumber = false
      --vim.wo.cursorline = false
            vim.diagnostic.config({
                virtual_text = false,
                underline = false,
                update_in_insert = false,
                severity_sort = false,
                float = {
                    border = false,
                    source = false,
                },
                signs = false,
                    numhl = {},
            })
    end))
  end,
})
