local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.laststatus = 2
opt.termguicolors = true
opt.scrolloff = 10
opt.winborder = 'rounded'

-- Tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 2
opt.expandtab = true

-- Display
opt.conceallevel = 2
opt.list = true
opt.listchars = { tab = "▏ ", trail = "·", nbsp = "␣" }
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Behavior
opt.mouse = "a"
opt.showmode = false
opt.breakindent = true
opt.undofile = true
opt.inccommand = "split"
opt.confirm = true

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Sessions
opt.sessionoptions = {
	"buffers",
	"curdir",
	"tabpages",
	"winsize",
	"help",
	"globals",
	"skiprtp",
	"folds",
}

-- Backup
opt.backupskip = { "/tmp/*", "/private/tmp/*" }

-- Comments
opt.formatoptions:append("r")

-- Clipboard (sync with OS)
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)
