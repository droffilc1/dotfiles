return {
  -- Vague
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
  },
  -- Tokyonight
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
    end
  },

  -- Catppuccin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Gruvbox (set default here)
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Telescope (colorscheme switcher)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({})

      vim.keymap.set("n", "<leader>ut", function()
        builtin.colorscheme({ enable_preview = true })
      end, { desc = "Pick Theme" })
    end,
  },
}
