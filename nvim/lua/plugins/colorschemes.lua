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
		transpoarent = false,
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

	-- kanagawa
	{ "rebelot/kanagawa.nvim" },

	-- one-dark
	-- Using Lazy
	{
		"navarasu/onedark.nvim",
		priority = 1000,
		config = function()
			require("onedark").setup({
				style = "darker",
			})
			require("onedark").load()
		end,
	},
	-- everblush
	{ "Everblush/nvim" },
	-- biscuit
	{
		"Biscuit-Theme/nvim",
		name = "biscuit",
	},
	-- fullerene
	{
		"steguiosaur/fullerene.nvim",
		lazy = false,
		priority = 1000,
	},
	--oxocarbon
	{ "nyoom-engineering/oxocarbon.nvim" },
}
