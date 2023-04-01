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
require("user.nvim-tree")
require("user.undotree")
require("user.lualine")
require("user.indent-blankline")

-- Extra stuff
require("user.impatient")
require("user.harpoon")
