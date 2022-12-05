local o = vim.opt
--[[ local c = vim.cmd ]]

-- :help options
o.backup = false				-- creates a backup file
o.clipboard = 'unnamedplus'			-- allows nvim to access the system clipboard
-- o.cmdheight = 4					-- more space in nvim command line for displaying messages
o.completeopt = { 'menuone', 'noselect' }	-- mostly just for cmp
o.conceallevel = 0				-- `` is ivisble in markdown files
o.fileencoding = 'utf-8'			-- sets the file encoding
o.hlsearch = true				-- highlight all matches on prev search pattern
o.ignorecase = true				-- ignore case in search patterns
o.mouse = 'a'					-- enables mouse
o.pumheight = 10				-- pop up menu height
o.showmode = false				-- disables the mode (ex. -- INSERT --)
o.showtabline = 4				-- always show tabs
o.smartcase = true				-- smart case
o.smartindent = true				-- smart indent
o.splitbelow = true				-- all horizontal splits go under the current window
o.splitright = true				-- all vertical splits go to the right of current window
o.swapfile = false				-- creates a swapfile
o.termguicolors = true				-- set terminal gui colors
o.timeoutlen = 1000				-- time to wait for a wampped sequence to complete (in miliseconds)
o.undofile = true				-- enable persistent undo
o.updatetime = 300				-- faster completion (4000ms default)
o.writebackup = false				-- Writes backup if a file is being edited by another program
o.expandtab = true				-- converts tab to spaces
o.shiftwidth = 4				-- num of spaces for each indentation
o.tabstop = 4					-- num of spaces for each tab
o.cursorline = true             		-- highlight current line
o.number = true                 		-- set numbered lines
o.relativenumber = true        			-- set relative numbered lines
o.numberwidth = 4               		-- set number column width
o.signcolumn = 'yes'            		-- always show the sign column, otherwise it would shift the text each time
o.wrap = true                   		-- deals with wrap
o.scrolloff = 8                 		-- num of screen lines to keep above and below the cursor
o.sidescrolloff = 8             		-- same as above, but left to right

