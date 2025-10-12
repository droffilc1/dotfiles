local scheme_switcher = require("config.scheme_switcher")

require("config.keymaps")
require("config.lazy")
require("config.lsp")
require("config.options")
require("config.autocmds")
require("config.floaterminal")
require("config.menu")

-- colorscheme
scheme_switcher.set_colorscheme(scheme_switcher.get_current_colorscheme())
