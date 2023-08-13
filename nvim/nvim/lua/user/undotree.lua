local opts = { noremap = true, silent = true }

local k = vim.api.nvim_set_keymap

k("n", "<leader>u", ":UndotreeShow<CR>:UndotreeFocus<CR>", opts)
