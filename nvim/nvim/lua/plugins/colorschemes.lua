return {
	-- Vague
	{
		"vague2k/vague.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme vague")
		end,
	},
	-- Tokyonight
	{
		"folke/tokyonight.nvim",
		priority = 1000,
	},

	-- Catppuccin
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	-- Gruvbox (set default here)
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
	},

	-- Solarized Osaka
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	-- Dracula
	{ "Mofiqul/dracula.nvim" },

	-- vn-night
	{ "nxvu699134/vn-night.nvim" },
}
