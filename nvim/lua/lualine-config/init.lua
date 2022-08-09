--old configuration
 require('lualine').setup({
    options = { section_separators = '', component_separators = '',theme='nightfox' },
     sections = {lualine_a = {'mode'}}
 })
 --


--new configuration
-- local ok, lualine = pcall(require, 'lualine')
-- if not ok then
--   return
-- end
--
-- lualine.setup({
--   options = {
--     icons_enabled = true,
--     theme = 'nightfox',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {},
--     always_divide_middle = true,
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff', ''},
--      lualine_c = { { "filename", path = 1 } },
--     --lualine_c = { { "filename" } },
--     lualine_x = { "diagnostics", "encoding", "fileformat", "filetype" },
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {}
-- }) 
