return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "html", "javascript" })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      vim.filetype.add({
        extension = {
          ejs = "html",
        },
      })
    end,
  },
}
