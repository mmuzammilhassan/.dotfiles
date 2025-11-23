return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" }, -- ⚡ lazy-load before reading files
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "lua", "php", "json", "yaml", "markdown" }, -- ✅ keep small
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      -- optional: disable for huge files
      disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    -- small delay to make BufRead snappier
    vim.defer_fn(function()
      require("nvim-treesitter.configs").setup(opts)
    end, 20)

    -- 🔥 Custom command to reload Treesitter instantly
  vim.api.nvim_create_user_command("TSReloadFast", function()
    package.loaded["nvim-treesitter.configs"] = nil
    require("nvim-treesitter.configs").setup(opts)
    vim.notify("Treesitter reloaded!", vim.log.levels.INFO)
  end, { desc = "Reload Treesitter config without restarting" })
end,
}
