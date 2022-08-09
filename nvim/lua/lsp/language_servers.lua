--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
--capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

--require'lspconfig'.cssls.setup{
--    capabilities = capabilities,
--}

--require'lspconfig'.pyright.setup{
--    capabilities = capabilities,
--}
--require'lspconfig'.clangd.setup{
--    capabilities = capabilities,
--}

--require'lspconfig'.tsserver.setup{
--    capabilities = capabilities,
--}
--



-- local lsp_installer = require('nvim-lsp-installer')
--
-- lsp_installer.on_server_ready(function(server)
--   local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol
--                                                                        .make_client_capabilities())
--   local opts = {capabilities = capabilities}
--   if server.name == "sumneko_lua" then
--     opts = vim.tbl_deep_extend("force", {
--       settings = {
--         Lua = {
--           runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
--           diagnostics = {globals = {'vim'}},
--           workspace = {library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false},
--           telemetry = {enable = false}
--         }
--       }
--
--     }, opts)
--   end
--   server:setup(opts)
-- end)




--prev configuration

local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

-- 1. Set up nvim-lsp-installer first!
lsp_installer.setup {}

-- 2. (optional) Override the default configuration to be applied to all servers.
lspconfig.util.default_config = vim.tbl_extend(
    "force",
    lspconfig.util.default_config,
    {
        on_attach = on_attach
    }
)

-- 3. Loop through all of the installed servers and set it up via lspconfig
for _, server in ipairs(lsp_installer.get_installed_servers()) do
  lspconfig[server.name].setup {}
end


-- lsp-signature 
require "lsp_signature".setup({
  floating_window = true,
  floating_window_off_y = 0,
  bind = true,
  floating_window_above_cur_line = true,
  doc_lines = 10,
  hint_enable = false,
  handler_opts = {
    border = "rounded"   
  },
  wrap=true,
  -- zindex = 1,
  -- hint_prefix = " >",
  -- max_width = 120,
})
-- extra setting 

-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--   -- lsp_signature.on_attach({
--   --     bind = true,
--   --     floating_window = false,
--   --     handler_opts = {
--   --       border = "single"
--   --     }
--   --   }, bufnr)
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- end

--new configuration 
local cwd = vim.loop.cwd
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true 
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "detail",
        "documentation",
        "additionalTextEdits",
    },
}
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Don't forget to install the server language via npm

lspconfig.clangd.setup({
    on_attach=on_attach,
    capabilities=capabilities,
    root_dir=cwd,
})

-- npm install -g typescript typescript-language-server

lspconfig.tsserver.setup({
 on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
}) 

-- npm i -g vscode-langservers-extracted
lspconfig.jsonls.setup({
   on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
})

-- npm install -g emmet-ls
lspconfig.emmet_ls.setup({
   on_attach = on_attach,
  capabilities = capabilities,
  root_dir = cwd,
})

-- npm i -g vscode-langservers-extracted
lspconfig.html.setup({
   on_attach = on_attach,
   capabilities = capabilities,
   root_dir = cwd,
})
 
-- lspconfig.pyright.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--    root_dir = cwd,
-- })
 
-- lspconfig.pylsp.setup({
--    on_attach = on_attach,
--    capabilities = capabilities,
--    root_dir = cwd,
-- })
require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}
