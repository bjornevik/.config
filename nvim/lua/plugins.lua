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
  { "NeogitOrg/neogit" },
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
    "sbdchd/neoformat",
    init = function()
      vim.keymap.set("n", "<leader>nf", ":Neoformat<CR>", { noremap = true, silent = true })
    end,
  },
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
  {
    "github/copilot.vim",
    init = function()
      vim.keymap.set("i", "<C-p>", 'copilot#Accept("<CR>")', { -- <(C)o-(p)ilot>
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },

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
    config = true,
    init = function()
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
      "nvim-telescope/telescope-file-browser.nvim",
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-dap.nvim",
    },
  },

  { "ThePrimeagen/harpoon" },

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

  -- DAP
  { "rcarriga/nvim-dap-ui" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "mfussenegger/nvim-dap" },

  -- FOLDS
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
  },
}
