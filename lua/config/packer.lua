-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Plugin manager
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }                             -- Fuzzy finder
    use('tanvirtin/monokai.nvim') -- Colorscheme: Monokai
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('theprimeagen/harpoon')
    use('mbbill/undotree')       -- Keymap: <leader>e
    use('rmagatti/auto-session') -- Session manager
    use('windwp/nvim-autopairs')

    -- UI
    use('stevearc/dressing.nvim')                                                           -- Input boxes?
    use({ 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }) -- Tabs
    use('moll/vim-bbye')
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    })                                         -- Bottom bar
    use("lukas-reineke/indent-blankline.nvim") -- Indent line

    -- Formatting
    use('williamboman/mason.nvim') -- :LspInstall to install language server
    use("williamboman/mason-lspconfig.nvim")
    use("neovim/nvim-lspconfig")
    use("stevearc/conform.nvim")

    -- Better comments
    use('numToStr/Comment.nvim')
    use('JoosepAlviste/nvim-ts-context-commentstring')

    -- Git
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')

    --LSP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    -- Neo Tree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }
end)
