-- vim.o.shell = 'pwsh.exe',
-- vim.o.shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
-- vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
-- vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
-- vim.o.shellquote = '',
-- vim.o.shellxquote = ''

-- this is for powershell as default shell
vim.cmd([[let &shell = 'pwsh'
let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
set shellquote= shellxquote=
]])
--


local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

--vim.builtin.terminal.shell="pwsh -NoLogo"

toggleterm.setup({
	size = 20,
	open_mapping = [[<F9>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})


-- for poewrshell as default
-- local Terminal = require("toggleterm.terminal").Terminal
-- local global = require("core.global")
-- require("toggleterm").setup({
--   size = function(term)
--     if term.direction == "horizontal" then
--       return 20
--     elseif term.direction == "vertical" then
--       return vim.o.columns * 0.4
--     end
--   end,
--   direction = "horizontal",
--   shade_terminals = vim.o.background == "dark",
--   float_opts = {
--     border = "double",
--     highlights = {
--       background = "DarkenedPanel",
--       border = "DarkenedPanel",
--     },
--   },
-- })
--
-- local shell = global.platform.is_windows and "powershell -NoLogo" or vim.o.shell
--
-- local terminals = {}
--
-- terminals.default = Terminal:new({
--   cmd = shell,
--   direction = "horizontal",
--   -- function to run on opening the terminal
--   on_open = function(term)
--     vim.cmd("startinsert!")
--     vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
--     vim.api.nvim_buf_set_keymap(
--       term.bufnr,
--       "t",
--       "<F8>",
--       [[<C-\><C-n><cmd>lua toggle_terminal('default')<cr>]],
--       { noremap = true, silent = true }
--     )
--   end,
-- })
--
-- _G.toggle_terminal = function(name)
--   terminals[name]:toggle()
-- end
--
-- vim.keymap.noremap("<F8>", [[<cmd>lua toggle_terminal('default')<cr>]])
