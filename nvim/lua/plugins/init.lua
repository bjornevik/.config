return {
  -- Colorscheme
  {
    "luisiacc/gruvbox-baby",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_baby_use_original_palette = true
      vim.cmd.colorscheme "gruvbox-baby"
    end,
  },

  -- Movement
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat",
      "ggandor/flit.nvim",
      "ggandor/leap-spooky.nvim",
    },
  },

  { "nvim-lua/plenary.nvim" },

  -- Git
  { "NeogitOrg/neogit", branch = "nightly" },
  { "sindrets/diffview.nvim" },
  { "lewis6991/gitsigns.nvim" },

  -- Utilty
  { "windwp/nvim-autopairs" },
  { "wellle/targets.vim" },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  { "numToStr/Comment.nvim" },
  {
    "AckslD/nvim-neoclip.lua",
    init = function()
      vim.keymap.set("n", "<leader>nc", require("telescope").extensions.neoclip.neoclip, { noremap = true })
    end,
    opts = {
      keys = {
        telescope = {
          i = {
            paste = "<cr>",
          },
        },
      },
    },
  },
  {
    "cshuaimin/ssr.nvim",
    init = function()
      vim.keymap.set({ "n", "x" }, "<leader>sr", function()
        require("ssr").open()
      end, { desc = "Structural Replace" })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  "github/copilot.vim", -- <TAB> to accept suggestion

  -- Adds textobject for camelCase, kebab-case etc, civ, div
  { "Julian/vim-textobj-variable-segment", dependencies = "kana/vim-textobj-user" },

  -- mason
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  -- lsp
  { "neovim/nvim-lspconfig" },
  { "nvim-tree/nvim-web-devicons" },
  { "folke/trouble.nvim" },

  -- language specific plugins
  { "simrat39/rust-tools.nvim" },
  { "folke/neodev.nvim" },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    init = function()
      local bjorneviklsp = require "bjornevik.lsp"
      require("flutter-tools").setup {
        lsp = {
          on_attach = bjorneviklsp.on_attach,
          capabilities = bjorneviklsp.capabilities,
        },
      }
      vim.keymap.set("n", "<leader>ft", ":FlutterOutlineToggle<CR>", { noremap = true, silent = true })
    end,
  },

  -- Autocomplete
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-nvim-lua" },
  { "onsails/lspkind-nvim" },
  { "rafamadriz/friendly-snippets" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/nvim-cmp" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      "Ckolkey/ts-node-action",
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          vim.g.skip_ts_context_commentstring_module = true
          require("ts_context_commentstring").setup {
            enable_autocmd = false,
          }
        end,
      },
      {
        "Wansmer/treesj",
        config = function()
          require("treesj").setup { use_default_keymaps = false }
        end,
      },
      {
        "danymat/neogen",
        config = function()
          require("neogen").setup {}
        end,
      },
    },
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzy-native.nvim",
      "debugloop/telescope-undo.nvim",
    },
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup { columns = { "icon" }, view_options = { show_hidden = true } }
      vim.keymap.set("n", "<leader>fb", "<cmd>Oil<cr>", { desc = "Open parent directory" })
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Appearance
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  { "goolord/alpha-nvim" },

  { "stevearc/dressing.nvim" },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup { enable_tailwind = true }
    end,
  },
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/bufferline.nvim" },

  -- FOLDS
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
  },

  require "plugins.debug",
  require "plugins.formatting",
}
