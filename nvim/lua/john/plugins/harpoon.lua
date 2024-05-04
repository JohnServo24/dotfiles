return {
    "theprimeagen/harpoon",
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        local opts = { noremap = true, silent = true }
        local k = vim.keymap.set

        k("n", "<leader>hh", ui.toggle_quick_menu, opts)
        k("n", "<leader>hs", mark.add_file, opts)

        k("n", "<A-j>", function() ui.nav_file(1) end, opts)
        k("n", "<A-k>", function() ui.nav_file(2) end, opts)
        k("n", "<A-l>", function() ui.nav_file(3) end, opts)
        k("n", "<A-h>", function() ui.nav_file(4) end, opts)
    end
}
