vim.cmd [[
  " ensure top-level PopUp is removed first to avoid duplicates
  silent! aunmenu PopUp
]]

-- create an augroup and a MenuPopup autocmd that *recreates* the popup menu safely
local group = vim.api.nvim_create_augroup("nvim_popupmenu", { clear = true })
vim.api.nvim_create_autocmd("MenuPopup", {
  pattern = "*",
  group = group,
  desc = "Rebuild PopUp menu on demand (safe/no E329)",
  callback = function()
    -- remove any existing PopUp.* entries (silent to avoid errors)
    vim.cmd("silent! aunmenu PopUp")

    -- Always create the safe common items
    vim.cmd([[
      anoremenu PopUp.Inspect     <cmd>Inspect<CR>
      amenu PopUp.-1-             <NOP>
      nnoremenu PopUp.Back        <C-t>
      amenu PopUp.-2-             <NOP>
    ]])

    -- Create LSP-related entries only if LSP is attached to this buffer
    if next(vim.lsp.get_clients({ bufnr = 0 })) then
      -- Use try/catch to be extra safe
      vim.cmd([[
        try
          anoremenu PopUp.Definition  <cmd>lua vim.lsp.buf.definition()<CR>
          anoremenu PopUp.References  <cmd>Telescope lsp_references<CR>
        catch
        endtry
      ]])
    end

    -- Create URL item only if a URL is detected (pcall to avoid missing API)
    local ok, ui = pcall(require, "vim.ui")
    if ok and type(ui._get_urls) == "function" then
      local urls = ui._get_urls()
      if urls and urls[1] and vim.startswith(urls[1], "http") then
        vim.cmd([[try | amenu PopUp.URL gx | catch | endtry]])
      end
    end
  end,
})
