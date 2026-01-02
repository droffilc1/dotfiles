return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {},
        per_filetype = {
          ["html"] = {
            enable_close = false,
          },
        },
      })
    end,
  },
  {
    "3rd/image.nvim",
    build = false,
    opts = {
      processor = "magick_cli",
      integrations = {
        markdown = {
          only_render_image_at_cursor = true,
          only_render_image_at_cursor_mode = "popup",
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    event = "VimEnter",
    version = "1.*",
    dependencies = {
      "onsails/lspkind.nvim",
      "L3MON4D3/LuaSnip",
      "mlaursen/vim-react-snippets",
      "folke/lazydev.nvim",
    },
    opts = function()
      require("vim-react-snippets")
      local config = require("vim-react-snippets.config")
      config.readonly_props = false
      config.test_framework = "vitest"
      config.test_renderer_path = "@/test-utils"

      local lspkind = require("lspkind")

      -- 💡 Define colorized highlights for kinds (VSCode-style)
      local kind_colors = {
        Text = "Identifier",
        Method = "Function",
        Function = "Function",
        Constructor = "Type",
        Field = "Constant",
        Variable = "Identifier",
        Class = "Type",
        Interface = "Type",
        Module = "Include",
        Property = "Constant",
        Unit = "Number",
        Value = "Number",
        Enum = "Type",
        Keyword = "Keyword",
        Snippet = "Special",
        Color = "Constant",
        File = "Directory",
        Reference = "Constant",
        Folder = "Directory",
        EnumMember = "Type",
        Constant = "Constant",
        Struct = "Type",
        Event = "Special",
        Operator = "Operator",
        TypeParameter = "Type",
      }

      -- apply highlight links dynamically
      for kind, hl in pairs(kind_colors) do
        vim.api.nvim_set_hl(0, "BlinkCmpKind" .. kind, { link = hl })
      end

      return {
        keymap = { preset = "default" },

        appearance = {
          nerd_font_variant = "mono",

          -- use lspkind icons for kinds
          kind_icons = lspkind.symbol_map,
        },

        completion = {
          -- show docs only when requested
          documentation = { auto_show = false, auto_show_delay_ms = 500 },
        },

        sources = {
          default = { "lsp", "path", "snippets", "lazydev" },
          providers = {
            lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
          },
        },

        snippets = { preset = "luasnip" },
        fuzzy = { implementation = "lua" },
        signature = { enabled = true },
      }
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
}
