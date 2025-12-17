return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{
					header = [[
               ___      .______       __       _______. _______ 
              /   \     |   _  \     |  |     /       ||   ____|
             /  ^  \    |  |_)  |    |  |    |   (----`|  |__   
            /  /_\  \   |      /     |  |     \   \    |   __|  
           /  _____  \  |  |\  \----.|  | .----)   |   |  |____ 
          /__/     \__\ | _| `._____||__| |_______/    |_______|
                                                      
            ]],
				},
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
				{ icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
				{ section = "startup" },
			},
		},
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
