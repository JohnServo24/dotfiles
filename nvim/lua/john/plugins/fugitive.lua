local opts = { noremap = true, silent = true }

local k = vim.api.nvim_set_keymap

k("n", "<leader>gs", ":Git<CR>", opts)
k("n", "<leader>ga", ":Git add . <CR>", opts)
k("n", "<leader>gj", ":Git commit -m \"\"<Left>", opts)

return {
    "tpope/vim-fugitive",
}
