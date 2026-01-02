return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    columns = { "icon" },
    keymaps = {
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["<C-k>"] = false,
      ["<C-j>"] = false,
      ["<M-h>"] = "actions.select_split",
    },
    view_options = { show_hidden = true },
  },
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  -- Open parent directory in current window
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
}
