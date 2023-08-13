local opts = { noremap = true, silent = true }

local k = vim.api.nvim_set_keymap

-- Remap space as leader key
k("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remap ESC as CTRL className = {}
k("", "<ESC>", "<C-c>", opts)

-- MODES
--  normal_mode = 'n'
--  inser_mode = 'i'
--  visual_mode = 'v'
--  visual_block_mode = 'x'
--  term_mode = 't'
--  command_mode = 'c'

-- NORMAL --
-- Refresh nvim --
k("n", "<F5>", ":luafile %<CR>", opts)

-- Disable/Enable LSP --
k("n", "<F6>", ":lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>", opts)
k("n", "<F7>", ":edit<CR>", opts)

-- Filetree
k("n", "<leader>ee", ":Rex<CR>", opts)
k("n", "<leader>er", ":e .<CR>", opts)

-- Make cursor stay in place when appending next line
k("n", "J", "mzJ`z", opts)

-- Make cursor stay in the middle when searching
k("n", "n", "nzzzv", opts)

-- Make cursor stay in the middle when half-jumping
k("n", "<C-d>", "<C-d>zz", opts)
k("n", "<C-u>", "<C-u>zz", opts)

-- Yank to clipboard
k("n", "<leader>y", '"+y', opts)

-- Replace all instances of current word
k("n", "<leader>sa", [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gi<left><left><left>]], opts)

-- Replace all instances of current word in the current lin
k("n", "<leader>sl", [[:s/\<<c-r><c-w>\>/<c-r><c-w>/gi<left><left><left>]], opts)

-- Make current file executable
k("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

-- Increment/decrement numbers
k("n", "<leader>+", "<C-a>", opts)
k("n", "<leader>-", "<C-x>", opts)

-- VISUAL --
-- Copy (NEED XCLIP IN ARCH)
k("v", "<leader>y", '"+y', opts)

-- Indent/unindent lines
k("v", "<Tab>", ">gv", opts)
k("v", "<S-tab>", "<gv", opts)
