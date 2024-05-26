return {
  -- Formatter 
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
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
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "prettierd",
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
  },
  -- Treesitter
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css", "javascript",
        "typescript", "tsx", "go",
        "rust",
  		},
  	},
  },
  -- Autocompletion
  {
  	"nvimtools/none-ls.nvim",
    lazy = false,
  	opts = function ()
      return require("configs.none_ls")
  	end,
  },
  -- Auto tags for HTML
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html"
    },
    config = function ()
      require("nvim-ts-autotag").setup()
    end
  },
  -- Session manager
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function ()
      require("auto-session").setup({
        log_level = "error",

        cwd_change_handling = {
          restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
          pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
          post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
            require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
          end,
        },
      })
     end
  },
  -- Undo tree
  {
    "mbbill/undotree", -- <leader>u
    lazy = false,
  },
  -- Session manager
  {
    "pocco81/auto-save.nvim",
    lazy = false,
    config = function()
      require "configs.auto-save"
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = false,
    config = function ()
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })
    end
  },
  {
    'tpope/vim-fugitive',
    event = "VeryLazy",
  }

}
