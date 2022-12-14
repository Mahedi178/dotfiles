vim.cmd('filetype plugin indent on')
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.o.cmdheight = 1
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.smartcase = true
vim.o.smartindent = true
vim.opt.termguicolors = true
vim.o.conceallevel = 0
vim.o.showtabline = 2
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.clipboard = "unnamedplus"
vim.o.ignorecase = true
vim.o.scrolloff = 3
vim.o.sidescrolloff = 3
vim.o.mouse = "a"
vim.wo.wrap = false
vim.wo.number = true
--vim.o.cursorline = true
vim.cmd[[set guicursor=i:hor20]]
vim.wo.signcolumn = "yes"
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.ruler = true
vim.o.showcmd = false
vim.o.numberwidth = 4
vim.o.relativenumber = true
vim.o.textwidth=140
vim.api.nvim_command('autocmd VimResized * wincmd =')
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
-- markdown stuff 
vim.g.mkdp_theme='light'
--[[ local keymap = vim.keymap
keymap.set('n', 'dw', 'vb"_d') ]]

