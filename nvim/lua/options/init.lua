vim.cmd('filetype plugin indent on')
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.whichwrap = 'b,s,<,>,[,],h,l'
vim.o.pumheight = 10
vim.o.fileencoding = 'utf-8'
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

-- markdown stuff 
vim.g.mkdp_theme='light'

-- latex stuff 
--vim.cmd('autocmd FileType tex nmap <buffer> <A-t> :!latexmk -pdf %<CR>')

--vim.cmd([[autocmd BufNewFile  *.cpp 0r ~/codelibrary/template.cpp]])
--vim.cmd([[autocmd BufWinEnter *.cpp call cursor(88,5)]])
--vim.cmd [[ autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ -std=c++17 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR> ]]
--vim.cmd[[autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r && ./%:r <CR>]]
--[[ vim.cmd[[
au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.cs,*.rkt,*.h,*.html,*.txt,*.js,*.go 
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=140 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    ]] 
