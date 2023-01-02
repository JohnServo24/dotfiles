local opts = { noremap = true, silent = true }

local k = vim.api.nvim_set_keymap

-- Remap semicolon as leader key
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
-- Better window naviagion --
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-l>", "<C-w>l", opts)

--  Window shortcuts --
k("n", "gn", ":vsplit<CR>:bprevious<CR>", opts)
k("n", "gm", ":<c-w>q<CR>", opts)

-- Saving --
k("n", "<C-s>", ":w<CR>", opts)

-- Select all --
k("n", "<C-a>", "ggVG", opts)

-- Refresh nvim --
k("n", "<F5>", ":luafile %<CR>", opts)

-- Insert one line above/below without leaving normal mode --
k("n", "<A-o>", "o<ESC>", opts)
k("n", "<A-O>", "O<ESC>", opts)

-- Resize with arrows
k("n", "<C-Up>", ":resize +3<CR>", opts)
k("n", "<C-Down>", ":resize -1<CR>", opts)
k("n", "<C-Left>", ":vertical resize +3<CR>", opts)
k("n", "<C-Right>", ":vertical resize -1<CR>", opts)

-- Navigate buffers
k("n", "<s-l>", ":bnext<CR>", opts)
k("n", "<s-h>", ":bprevious<CR>", opts)

-- Exit buffer
k("n", "<C-c>", ":bd<CR>", opts)

-- Remove highlight from search
k("n", "g/", ":noh<CR>", opts)

-- Make cursor stay in place when appending next line
k("n", "J", "mzJ`z", opts)

-- Make cursor stay in the middle when searching
k("n", "n", "nzzzv", opts)
k("n", "m", "nzzzv", opts)

-- Make cursor stay in the middle when half-jumping
k("n", "<c-d>", "<C-d>zz", opts)
k("n", "<c-u>", "<C-u>zz", opts)

-- Yank to clipboard
k("n", "<leader>y", '"+y', opts)
k("n", "<leader>y", '"+y', opts)

-- Delete to void
k("n", "<leader>d", '"_d', opts)

-- Replace all instances of current word
k("n", "<leader>s", [[:%s/\<<c-r><c-w>\>/<c-r><c-w>/gi<left><left><left>]], opts)

-- Make current file executable
k("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)

-- Indent/unindent lines
k("n", "<Tab>", ">>", opts)
k("n", "<S-tab>", "<<", opts)

-- InCRement/decrement numbers
k("n", "<leader>+", "<C-a>", opts)
k("n", "<leader>-", "<C-x>", opts)

-- Make CTRL + Z quit
k("n", "<C-z>", ":q<CR>", opts)

-- INSERT --
-- Had to use <C-c> instead of <ESC> because
-- <ESC> duplicates blocks of code on save for some reason
k("i", "<C-s>", "<C-c>:w<CR>", opts)

-- Make CTRL + Z quit in insert
k("i", "<C-z>", ":q!<CR>", opts)

-- VISUAL --
k("v", "<C-s>", "<C-c>:w<CR>", opts)

-- Move text up and down
k("v", "K", ":m '<-2<CR>gv=gv", opts)
k("v", "J", ":m '>+1<CR>gv=gv", opts)

-- Maintain clipboard when copy pasting in visual mode
k("v", "p", "'_dp", opts)

-- Yank to clipboard in visual mode
k("v", "<leader>y", '"+y', opts)

-- Delete to void in visual mode
k("v", "<leader>d", '"_d', opts)

-- Indent/unindent lines
k("v", "<Tab>", ">gv", opts)
k("v", "<S-tab>", "<gv", opts)

-- Make CTRL + Z quit in visual mode
k("v", "<c-z>", ":q!<cr>", opts)

-- Visual Block --
k("x", "<C-s>", "<ESC>:w<CR>", opts)

-- Maintain clipboard when copy pasting in visual block mode
k("x", "p", '"_dp', opts)

-- Telescope --
k(
	"n",
	"<leader>ff",
	'<cmd>lua require"telescope.builtin".find_files(require("telescope.themes").get_dropdown({ previewer = false }))<CR>',
	opts
)
k("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", opts)
k("n", "<leader>fc", "<cmd>Telescope grep_string<CR>", opts)
k("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
k("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Projects --
k("n", "<F2>", ":Telescope projects<CR>", opts)

-- Nvimtree
k("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Alpha greeter --
k("n", "<F3>", ":Alpha<CR>", opts)
