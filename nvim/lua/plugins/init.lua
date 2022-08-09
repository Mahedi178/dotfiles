return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
      'tamton-aquib/staline.nvim',
       requires = { 'kyazdani42/nvim-web-devicons', opt = true }
       --event="BufRead" --,
       --config="require('staline-config')"
    }

    use {
        'akinsho/bufferline.nvim', tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly'
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'folke/which-key.nvim'
    use 'williamboman/nvim-lsp-installer'
    use 'neovim/nvim-lspconfig'
    --use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- For vsnip users.
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    --
    use {
        "L3MON4D3/LuaSnip",
        requires = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    }
    use 'saadparwaiz1/cmp_luasnip'
    use {
        'onsails/lspkind-nvim',
        config = function()
            require("lspkind").init()
        end,
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate" }
    use 'p00f/nvim-ts-rainbow'
    use 'windwp/nvim-ts-autotag'
    use 'windwp/nvim-autopairs'
    use {
        'phaazon/hop.nvim',
        branch = 'v1', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use 'kshenoy/vim-signature'
    use 'karb94/neoscroll.nvim'
    use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
        require("toggleterm").setup()
    end
    }
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
    use 'lervag/vimtex'
    use 'Pocco81/AutoSave.nvim'
    use 'ray-x/lsp_signature.nvim'
    use({
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

    -- ################ Colorscheme #################
    use 'Mofiqul/vscode.nvim'
    use 'shaunsingh/nord.nvim'
    use 'EdenEast/nightfox.nvim'
    use 'monsonjeremy/onedark.nvim'
    use 'tomasiser/vim-code-dark'
    use 'tyrannicaltoucan/vim-deep-space'
    use 'doums/darcula'
    use 'Aryansh-S/fastdark.vim'
    use 'lifepillar/vim-gruvbox8'
    use 'cocopon/iceberg.vim'



    -- #### icon 
    use "stevearc/dressing.nvim"
    use({
      "ziontee113/icon-picker.nvim",
      config = function()
        require("icon-picker")
      end,
    })

    -- ######## color picker ########
    --
   use ({
       "ziontee113/color-picker.nvim",
        config = function()
            require("color-picker")
        end,
    }) 
    

    -- ######## pop up UI ########## 
    use 'MunifTanjim/nui.nvim'

    --[[ use({
        'weilbith/nvim-code-action-menu',
         cmd = 'CodeActionMenu',
    }) ]]



    -- ################ competitive programming #######
    use 'searleser97/cpbooster.vim'
    --use 'p00f/cphelper.nvim'
end)
