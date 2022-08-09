vim.g.completeopt="menu,menuone,noselect,noinsert"
 --[[ local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end ]]

 local has_words_before = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    return (vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], true)[1] or ""):sub(cursor[2], cursor[2]):match "%s"
  end


local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
local types = require "cmp.types"
local str = require "cmp.utils.str"

-- completion maps (not cmp) --
-- line completion - use more!
-- inoremap <C-l> <C-x><C-l>
vim.api.nvim_set_keymap("i", "<c-l>", "<c-x><c-l>", { noremap = true })
-- Vim command-line completion
-- inoremap <C-v> <C-x><C-v>
vim.api.nvim_set_keymap("i", "<c-v>", "<c-x><c-v>", { noremap = true })
-- end non-cmp completion maps --

-- Setup nvim-cmp
local cmp = require "cmp"

-- lspkind
local lspkind = require "lspkind"

-- luasnip 


local snip_ok, luasnip = pcall(require, 'luasnip')
if not snip_ok then
   return
end


require("luasnip/loaders/from_vscode").lazy_load { paths = "~/AppData/Local/nvim/snippets" }


cmp.setup {
  -- snippet = {
  --   expand = function(args)
  --     vim.fn["vsnip#anonymous"](args.body)
  --   end,
  -- },
 snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  mapping = {

      --######################### vsnip ##############
      --begin
    --   ["<Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif vim.fn["vsnip#available"](1) == 1 then
    --     feedkey("<Plug>(vsnip-expand-or-jump)", "")
    --   elseif has_words_before() then
    --     cmp.complete()
    --   else
    --     fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    --   end
    -- end, { "i", "s" }),
    --
    -- ["<S-Tab>"] = cmp.mapping(function()
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif vim.fn["vsnip#jumpable"](-1) == 1 then
    --     feedkey("<Plug>(vsnip-jump-prev)", "")
    --   end
    -- end, { "i", "s" }),
    -- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    -- ["<C-f>"] = cmp.mapping.scroll_docs(4),
    -- ["<C-Space>"] = cmp.mapping.complete(),
    -- ["<CR>"] = cmp.mapping {
    --   i = cmp.mapping.confirm { select = true },
    -- },
    -- ["<Right>"] = cmp.mapping {
    --   i = cmp.mapping.confirm { select = true },
    -- },
    -- -- ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
    -- -- ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    -- ["<C-e>"] = cmp.mapping.abort(),
    -- ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, { "i" }),
    -- ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { "i" }),

    --vsnip end



     -- ########## this is for luasnip ##########  begin()


    --begin
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<C-j>"] = cmp.mapping.select_next_item(),
    -- 出现补全
    ["<C-<space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
	 ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
	 ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    -- super Tab
        ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
      else
        fallback()
      end
    end,
        ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
      else
        fallback()
      end
    end,
    --luasnip end



  },
  experimental = {
    ghost_text = true,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  sources = {
    -- 'crates' is lazy loaded
    { name = 'nvim_lsp_signature_help' },
    { name = "nvim_lsp" },
    { name = "treesitter" },
    -- { name = "vsnip" },
    { name = 'luasnip' },
    { name = "path" },
    {
      name = "buffer",
      -- option = {
      --   get_bufnrs = function()
      --     return vim.api.nvim_list_bufs()
      --   end,
      -- },
    },
    { name = "spell" },
  },
  formatting = {
    fields = {
      cmp.ItemField.Abbr,
      cmp.ItemField.Kind,
      cmp.ItemField.Menu,
    },
    format = lspkind.cmp_format {
      mode = "symbol_text",
      maxwidth = 60,
      before = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "ﲳ",
          nvim_lua = "",
          treesitter = "",
          path = "ﱮ",
          buffer = "﬘",
          zsh = "",
          vsnip = "",
          spell = "暈",
        })[entry.source.name]

        -- Get the full snippet (and only keep first line)
        local word = entry:get_insert_text()
        if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
          word = vim.lsp.util.parse_snippet(word)
        end
        word = str.oneline(word)
        if
          entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
          and string.sub(vim_item.abbr, -1, -1) == "~"
        then
          word = word .. "~"
        end
        vim_item.abbr = word

        return vim_item
      end,
    },
  },
}

 cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
-- insert `(` after select function or method item
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })





