local rustaceanvim_version = vim.fn.has "nvim-0.12" == 1 and "^9" or "^8"

return {
  -- Formatter
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      require "configs.conform"
    end,
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"
      local actions = require "telescope.actions"

      conf.defaults.mappings.i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Esc>"] = actions.close,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
      }
      return conf
    end,
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- LSP manger
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "lua-language-server",
        "stylua",
        -- Ts/Js
        "vtsls",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettierd",
        "html-lsp",
        "css-lsp",
        -- "prettier",
        "prisma-language-server",
        -- Python
        "pyright",
        "mypy",
        "ruff",
        "black",
        "isort",
        -- Go
        "gopls",
        "rust-analyzer",
        "rustfmt",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = { "nvimtools/none-ls-extras.nvim", "jayp0521/mason-null-ls.nvim" },
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   enabled = false,
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- },
  -- tmux
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  -- Better colors
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function()
      return require "configs.treesitter"
    end,
  },
  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    lazy = false,
  },
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    opts = function()
      local conf = require "nvchad.configs.cmp"
      local cmp = require "cmp"

      conf.mapping = {
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Esc>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Insert,
          select = true,
        },
      }
      return conf
    end,
  },
  -- Git integration
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  -- Auto tags for HTML
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- Session manager
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup {
        log_level = "error",

        cwd_change_handling = {
          restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
          pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
          post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
            require("nvim-tree").NvimTreeFocus()
            require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
          end,
        },
      }
    end,
  },
  -- Undo tree
  {
    "mbbill/undotree", -- <leader>u
    lazy = false,
  },
  -- Auto save
  {
    "pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require "configs.auto-save"
    end,
  },
  -- comments
  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  -- Context aware comments for JSX
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = false,
    config = function()
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
      }
    end,
  },
  -- Surround text
  {
    "echasnovski/mini.surround",
    lazy = false,
    config = function()
      require("mini.surround").setup()
    end,
  },
  -- Rust
  {
    "mrcjkb/rustaceanvim",
    -- To avoid being surprised by breaking changes,
    version = rustaceanvim_version,
    -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
    -- No need for lazy.nvim to lazy-load it.
    lazy = false,
  },
  -- {
  --   "rust-lang/rust.vim",
  --   ft = "rust",
  --   init = function()
  --     vim.g.rustfmt_autosave = 1
  --   end,
  -- },
  {
    "saecki/crates.nvim",
    ft = { "toml" },
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true,
          },
        },
      }
      require("cmp").setup.buffer {
        sources = { { name = "crates" } },
      }
    end,
  },
}
