--old configuration
-- require'nvim-tree'.setup{}
-- vim.cmd('nnoremap <C-n> :NvimTreeToggle<CR>')
-- vim.g.nvim_tree_auto_close = 1




-- new configuration
local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  return
end

nvim_tree.setup({
  sort_by = "case_sensitive",
  disable_netrw = true,
  update_cwd = true,   
  open_on_setup = true,
  reload_on_bufenter = true,
  update_focused_file = {
      enable = true,
      update_cwd = false,
  },
  view = {
    adaptive_size = true, 
    hide_root_folder = false,
    side = "left",  
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = { 
    group_empty = true,
    icons = { 
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },
    },
  }, 
  filters = {
      dotfiles = true,
      custom = { ".git", "node_modules", ".cache"},
  },
})







---------------###################################          latest configuration 

--[[ local status_ok, nvim_tree = pcall(require, 'nvim-tree')
if not status_ok then
  return
end

-- Call setup:
-- Each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`)
nvim_tree.setup {
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  --disable_netrw = false, -> already disabled on `/core/options.lua`
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = true,
  open_on_setup_file = false,
  open_on_tab = true,
  sort_by = "name",
  --reload_on_bufenter = false,
  reload_on_bufenter = true,
  respect_buf_cwd = false,
  update_cwd = true,
  view = {
    width = 32,
    height = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
    },
  },
}
]]


vim.api.nvim_set_keymap('n', '<c-n>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})


-- bufferline 

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.state'.set_offset(31, 'FileTree')
    end
  end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require'bufferline.state'.set_offset(0)
    end
  end
})

--vim.cmd[[noremap <silent> <C-n> :lua require'tree'.toggle()<CR>]]
