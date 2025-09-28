require("config.keymaps")
require("config.lazy")
require("config.options")
require("config.autocmds")
require("config.floaterminal")
require("config.menu")


vim.lsp.enable({ "clangd", "luals", "tsgo" })
vim.diagnostic.config({
  -- Use the default configuration
  virtual_lines = true

  -- Alternatively, customize specific options
  -- virtual_lines = {
  --  -- Only show virtual line diagnostics for the current cursor line
  --  current_line = true,
  -- },
})

vim.cmd("set completeopt+=noselect")
