return {
  {
    "nvim-tree/nvim-tree.lua",
    nversion = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- Collection of common configurations for the Nvim LSP client
  "neovim/nvim-lspconfig",
  -- Visualize lsp progress
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end
  },

  -- Autocompletion framework
  "hrsh7th/nvim-cmp",
  {
    -- cmp LSP completion
    "hrsh7th/cmp-nvim-lsp",
    -- cmp Snippet completion
    "hrsh7th/cmp-vsnip",
    -- cmp Path completion
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    dependencies = {
      "hrsh7th/nvim-cmp",
    }
  },
  -- Snippet engine
  "hrsh7th/vim-vsnip",
  -- Adds extra functionality over rust analyzer
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false,
  },

  -- Optional
  "nvim-lua/popup.nvim",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope.nvim",
}
