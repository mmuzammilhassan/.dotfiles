-- THIS IS THE FINAL NOTES.MD CODE TO TOGGLE
vim.keymap.set("n", "<leader>nn", function()
  local notes_path = vim.fn.expand("~/NOTES.md")
  local current_file = vim.api.nvim_buf_get_name(0)

  if current_file == notes_path then
    vim.cmd("edit #")
    return
  end

  vim.cmd("edit " .. notes_path)

  local date_header = "## " .. os.date("%B %d, %Y - %H:%M")
  local new_block = {
    "",
    date_header,
    "",
    "      TITLE: ",
    "             ",
    "- [ ] TO-DO: ",
    "- [ ] ERROR: ",
    "- [ ] IDEA:  ",
    "      REF:   ",
    "",
    string.rep("-", 80),
    ""
  }

  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local has_today = false
  for _, line in ipairs(lines) do
    if line:find(os.date("%B %d, %Y")) then
      has_today = true
      break
    end
  end

  if not has_today then
    -- Insert at END of file
    local last_line = #lines
    vim.api.nvim_buf_set_lines(0, last_line, last_line, false, new_block)
    vim.api.nvim_win_set_cursor(0, { last_line + 4, 8 })  -- Line 4 of new_block, column after "- TO-DO: "
    vim.cmd("startinsert!")
  else
    vim.cmd("normal! G")
    --vim.cmd("normal! gg")
    --vim.cmd("startinsert!")
  end
end, { desc = "Toggle NOTES.md with date and time block" })

-- CHECKBOX OR UNCHECKED
-- Normal mode: insert a new unchecked task
vim.keymap.set("n", "<leader>cb", "o- [ ] ", { desc = "Insert checkbox", noremap = true })
-- Visual mode: toggle selected lines into checkboxes
vim.keymap.set("v", "<leader>cb", ":<C-u>'<,'>s/^\\s*/- [ ] /<CR>", { noremap = true, desc = "Add checkboxes" })
