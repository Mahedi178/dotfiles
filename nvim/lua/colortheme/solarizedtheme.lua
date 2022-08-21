--vim.cmd[[set termguicolors]]
vim.o.background='dark' -- light, dark 
vim.cmd[[colorscheme solarized8_flat]] -- solarized8, solarized8_high, solarized8_low, solarized8_flat 
 vim.cmd[[
  hi Normal guibg=NONE ctermbg=NONE
  hi clear LineNr
  hi LineNr ctermfg=white ctermbg=none
]] 
