local wk = require("which-key")
local mappings = {
    q = { ":q<CR>", "Quit"},
    x = { ":bdelete<cr>", "Buffer close" },
    f = { ":Telescope find_files<cr>", " find files" },
    l = { ":Telescope live_grep<cr>", " live grep" },
    g = { ":Telescope grep_string<cr>", "Telescope grep string"},
    r = { ":Telescope resume<cr>", "Telescope resume"},
    b = { ":Telescope buffers<cr>", " find buffers" },
    t = { ":Telescope colorscheme<cr>", "嗀 colorscheme"},
    

}
local opts = { prefix = '<leader>'}
wk.register(mappings, opts)

