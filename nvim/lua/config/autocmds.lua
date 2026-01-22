vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "sh", "zsh", "bash" },
	callback = function()
		vim.b.autoformat = false -- for conform.nvim
		vim.b.disable_autoformat = true -- for other formatters
	end,
})

local transparent = true
local group = vim.api.nvim_create_augroup("Transparency", { clear = true })

local function apply_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
end

local function revert_transparency()
	vim.cmd("colorscheme vague") -- reapply scheme defaults
end

vim.api.nvim_create_autocmd("ColorScheme", {
	group = group,
	callback = function()
		if transparent then
			apply_transparency()
		end
	end,
})

vim.api.nvim_create_user_command("TransparencyToggle", function()
	transparent = not transparent
	if transparent then
		apply_transparency()
	else
		revert_transparency()
	end
end, {})
