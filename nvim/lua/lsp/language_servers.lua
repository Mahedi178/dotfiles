--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) --nvim-cmp
--capabilities.textDocument.completion.completionItem.snippetSupport = true
----new
local status, lspinstaller = pcall(require, "nvim-lsp-installer")
if (not status) then return end
--new

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', ',D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', ',ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    --local opts = { noremap=true, silent=true }
    vim.keymap.set('n', ',e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', ',q', vim.diagnostic.setloclist, opts)
    vim.keymap.set('n', ',f', vim.lsp.buf.formatting, opts)

    -- formatting
    --[[ if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function() vim.lsp.buf.formatting_seq_sync() end
        })
    end ]]
end


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
    wrap = true,
    -- zindex = 1,
    -- hint_prefix = " >",
    -- max_width = 120,
})

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
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = cwd,
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
require 'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
        },
    },
}
