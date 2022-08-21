vim.g.mapleader = ' '
local opt = { noremap = true, silent = false }
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Quickly insert to normal mode , saving
map('i', 'mq', '<ESC>', opt)
map('v', 'mq', '<ESC>', opt)
map('x', 'mq', '<ESC>', opt)
map('n', 'mr', ':w<CR>', opt)

-- End of line and beginning of line
--map('n','S','^',opt)
--map('n','s','$',opt)

-- Tab related stuff

--map('n', 'tn', ':tabnew<Space>', opt)
--map('n', 'tj', ':bprevious<CR>', opt)
--map('n', 'tk', ':bnext<CR>', opt)

-- Better window movement
map('n', '<C-h>', '<C-w>h', opt)
map('n', '<C-j>', '<C-w>j', opt)
map('n', '<C-k>', '<C-w>k', opt)
map('n', '<C-l>', '<C-w>l', opt)

-- Increase / decrease width of the current window
map('n', '<S-Left>', '<C-w><', opt)
map('n', '<S-Right>', '<C-w>>', opt)

-- split window
map('n', ';h', ':split<Return><C-w>w',opt)
map('n', ';v', ':vsplit<Return><C-w>w',opt)


-- Better indenting
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)


--Move text up and down
map("v", "<S-Up>", ":m .-2<CR>==", opt)
map("v", "<S-Down>", ":m .+1<CR>==", opt)

-- Visual Block --
-- Move text up and down
map("x", "<S-Up>", ":move '<-2<CR>gv-gv", opt)
map("x", "<S-Down>", ":move '>+1<CR>gv-gv", opt)

-- Copy
map('n', 'cp', ':%y<CR>', opt)

-- Select all
map('n', '<C-a>', 'ggVG', opt)

-- Visual visual_block_mode 
map('n', '<A-v>', '<c-v>', opt)

-- window width increase or decrease 

map('n', '<S-Left>', '<C-W>>', opt)
map('n', '<S-Right>', '<C-W><', opt)

-- Easy motion related task

map('n', '<leader>f', ':HopChar1AC<CR>', opt)
map('n', '<leader>F', ':HopChar1BC<CR>', opt)
map('n', '<leader>l', ':HopLine<CR>', opt)
map('n', '<leader>w', ':HopWordAC<CR>', opt)
map('n', '<leader>W', ':HopWordBC<CR>', opt)

-- save and quit stuff 

map('n', '<leader>q', ':q!<CR>', opt)
map('n', '<leader>w', ':wq<CR>', opt)

--- Moving among buffers
map('n', '<leader>nn', ':bn<CR>', opt)
map('n', '<leader>pp', ':bp<CR>', opt)
map('n', '<leader>ff', ':bfirst<CR>', opt)
map('n', '<leader>ll', ':blast<CR>', opt)
map('n', '<leader>bd', ':BufferClose<CR>', opt)
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)



-- telescope related task
map('n', '<leader><leader>f', ':Telescope find_files<CR>', opt)
map('n', '<leader><leader>l', ':Telescope live_grep<CR>', opt)
map('n', '<leader><leader>g', ':Telescope grep_string<CR>', opt)
map('n', '<leader><leader>r', ':Telescope resume<CR>', opt)
map('n', '<leader><leader>b', ':Telescope buffers<CR>', opt)
map('n', '<leader><leader>t', ':Telescope colorscheme<CR>', opt)


-- markdown 
map('n', '<A-j>' , '<Plug>MarkdownPreview', opt)
map('n', '<A-k>' , '<Plug>MarkdownPreviewStop', opt)

-- latex stuff 
map('n', '<A-t>', ':VimtexCompile<CR>', opt)

-- run c++ 
--vim.cmd('autocmd filetype cpp nnoremap <F9> :w <bar> !g++ -std=c++17 -O2 -Wall -Wextra -Wno-unused-result -Wno-char-subscripts -Wshadow -Wfloat-equal -Wconversion -Wformat-signedness -Wvla -Wduplicated-cond -Wlogical-op -Wredundant-decls -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC % -o %:r<CR>')
--vim.cmd('autocmd filetype cpp nnoremap <F10> :!%:r.exe <CR>')

-- ##### icon stuff
map("n", "<Leader><Leader>i", "<cmd>PickEverything<cr>", opts)
map("i", "<C-i>", "<cmd>PickEverythingInsert<cr>", opts)


-- ######### Color picker``
map("n", "<a-p>", "<cmd>PickColor<cr>", opts)
map("i", "<a-p>", "<cmd>PickColorInsert<cr>", opts)



-- ####   Buffer related stuff ############# 

