-- lua/plugins/harpoon.lua
return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2", -- you were already on v2
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ha", function() require("harpoon"):list():add() end,                                    desc = "Harpoon add file" },
        { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon quick menu" },

        { "<M-h>",      function() require("harpoon"):list():select(1) end,                                desc = "Harpoon file 1" },
        { "<M-t>",      function() require("harpoon"):list():select(2) end,                                desc = "Harpoon file 2" },
        { "<M-n>",      function() require("harpoon"):list():select(3) end,                                desc = "Harpoon file 3" },
        { "<M-s>",      function() require("harpoon"):list():select(4) end,                                desc = "Harpoon file 4" },

--        { "<C-S-P>",    function() require("harpoon"):list():prev() end,                                   desc = "Harpoon prev file" },
--        { "<C-S-N>",    function() require("harpoon"):list():next() end,                                   desc = "Harpoon next file" },

        -- Your custom snacks file navigation only for harpoon2
        {
            "<leader>hp",
            function()
                local harpoon = require("harpoon")
                local entries = vim
                    .iter(harpoon:list().items)
                    :filter(function(item) return item.value end)
                    :enumerate()
                    :map(function(i, item)
                        return {
                            file = item.value,
                            text = string.format("[%d] %s", i, vim.fn.fnamemodify(item.value, ":t")),
                        }
                    end)
                    :totable()

                require("snacks.picker")({
                    title = "Harpoon",
                    items = entries,
                    preview = "file",
                    actions = {
                        ["default"] = function(selected)
                            if selected and selected.file then
                                vim.cmd.edit(vim.fn.fnameescape(selected.file))
                            end
                        end,
                    },
                })
            end,
            desc = "Open Harpoon with Snacks UI",
        },
    },
}
