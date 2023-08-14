-- Basic nvim stuff
require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.colorscheme")
require("user.treesitter")

-- LSP related
require("user.lsp")
require("user.fidget")

-- Git related
require("user.gitsigns")
require("user.fugitive")

-- QOL improvements
require("user.telescope")
require("user.autopairs")
require("user.comment")
require("user.undotree")
require("user.lualine")
require("user.indent-blankline")
require("user.harpoon")

-- Extra stuff
require("user.rest")
require("user.impatient")
require("user.discord")
