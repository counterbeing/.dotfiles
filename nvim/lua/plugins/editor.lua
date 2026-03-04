return {
  -- File explorer (replaces NERDTree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      filesystem = {
        follow_current_file = { enabled = true },
        filtered_items = { visible = true },
      },
    },
  },

  -- Fuzzy finder (replaces pick)
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/" },
      },
    },
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },

  -- Comment toggling
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- Surround motions
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Indent guides
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Which-key for discoverability
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
}
