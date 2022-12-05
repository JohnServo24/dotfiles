local opts = { noremap = true, silent = true }

local term_opts = { silent = true }
local k = vim.api.nvim_set_keymap

-- Remap semicolon as leader key
k('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- MODES
--  normal_mode = 'n'
--  inser_mode = 'i'
--  visual_mode = 'v'
--  visual_block_mode = 'x'
--  term_mode = 't'
--  command_mode = 'c'

-- Normal --
-- Better window naviagion --
k('n', '<C-h>', '<C-w>h', opts)
k('n', '<C-j>', '<C-w>j', opts)
k('n', '<C-k>', '<C-w>k', opts)
k('n', '<C-l>', '<C-w>l', opts)

--  Window shortcuts --
k('n', 'gn', ':vsplit<CR>:bprevious<CR>', opts)
k('n', 'gm', ':<c-w>q<cr>', opts)

-- Saving --key
k('n', '<C-s>', ':w<CR>', opts)

-- Select all --
k('n', '<C-a>', 'ggVG', opts)

-- Refresh nvim --
k('n', '<F5>', ':luafile %<CR>', opts)

-- Insert one line above/below without leaving normal mode --
k('n', '<A-o>', 'o<ESC>', opts)
k('n', '<A-O>', 'O<ESC>', opts)

-- Resize with arrows
k('n', '<C-Up>', ':resize +3<CR>', opts)
k('n', '<C-Down>', ':resize -1<CR>', opts)
k('n', '<C-Left>', ':vertical resize +3<CR>', opts)
k('n', '<C-Right>', ':vertical resize -1<CR>', opts)

-- Navigate buffers
k('n', '<S-l>', ':bnext<CR>', opts)
k('n', '<S-h>', ':bprevious<CR>', opts)
k('n', '<C-c>', ':bd<cr>', opts)

-- remove highlight from search
k('n', 'g/', ':noh<cr>', opts)

-- Insert --
k('i', '<C-s>', '<ESC>:w<CR>', opts)

-- Visual --
k('v', '<C-s>', '<ESC>:w<CR>', opts)

-- Stay in indent mode
k('v', '<', '<gv', opts)
k('v', '>', '>gv', opts)

-- Move text up and down
k('v', '<A-k>', ':m .-1<CR>==', opts)
k('v', '<A-j>', ':m .+2<CR>==', opts)

-- Maintain clipboard when copy pasting
k('v', 'p', '\'_dp', opts)

-- Visual Block --
k('x', '<C-s>', '<ESC>:w<CR>', opts)

-- Move text up and down
k('x', 'J', ':move \'>+2<CR>gv-gv', opts)
k('x', 'K', ':move \'<-1<cr>gv-gv', opts)

-- Terminal --
-- Better terminal navigation
k('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
k('t', '<c-j>', '<c-\\><c-n><c-w>j', term_opts)
k('t', '<c-k>', '<c-\\><c-n><c-w>k', term_opts)
k('t', '<c-l>', '<c-\\><c-n><c-w>l', term_opts)

-- Telescope --
k('n', '<leader>f',
    '<cmd>lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({ previewer = false }))<CR>'
    , opts)

-- Nvimtree
k('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Format --
k('n', 'gf', ':Format<CR>', opts)

-- Projects --
k('n', '<F2>', ':Telescope projects<CR>', opts)

-- Alpha greeter --
k('n', '<F3>', ':Alpha<CR>', opts)
