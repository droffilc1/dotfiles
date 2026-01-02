return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
    },

    keys = {
      {
        "<leader>g",
        function()
          _lazygit_toggle()
        end,
        desc = "Toggle Lazygit (float)",
      },
    },

    config = function(_, opts)
      local toggleterm = require("toggleterm")
      toggleterm.setup(opts)

      local Terminal = require("toggleterm.terminal").Terminal

      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = {
          border = "double",
        },
        on_open = function(term)
          vim.cmd("startinsert!")
          vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
        end,
        on_close = function()
          vim.cmd("startinsert!")
        end,
      })

      function _lazygit_toggle()
        lazygit:toggle()
      end
    end,
  },
}
