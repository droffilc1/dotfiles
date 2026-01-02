return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>fm",
				function()
					require("conform").format({ async = true, lsp_format = false })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true, sh = true, bash = true, zsh = true }
				if disable_filetypes[vim.bo[bufnr].filetype] then
					return nil
				else
					return { timeout_ms = 5000, lsp_format = false }
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				python = function(bufnr)
					if require("conform").get_formatter_info("ruff_format", bufnr).available then
						return { "ruff_format" }
					else
						return { "isort", "black" }
					end
				end,
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "deno_fmt" },
				jsonc = { "deno_fmt" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				zsh = {},
				["*"] = { "codespell" },
				["_"] = { "trim_whitespace" },
			},
			formatters = {
				shfmt = { prepend_args = { "-i", "2", "-ci" } },
			},
		},
	},
}
