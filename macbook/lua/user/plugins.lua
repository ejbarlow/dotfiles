local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  use "Mofiqul/dracula.nvim" -- Lua dracula colorscheme

  -- Completion
  use "hrsh7th/nvim-cmp" -- Completion plugin
  use "hrsh7th/cmp-buffer" -- Buffer completion source
  use "hrsh7th/cmp-path" -- Path completion source
  use "hrsh7th/cmp-cmdline" -- Vim command line completion source
  use "saadparwaiz1/cmp_luasnip" -- Snippet completion source
  use "L3MON4D3/LuaSnip" -- Snippet engine
  use "rafamadriz/friendly-snippets" -- Community driven snippets
  use "hrsh7th/cmp-nvim-lsp" -- lsp completion source
  use "hrsh7th/cmp-nvim-lsp-signature-help" -- Method signature completion source
  use "hrsh7th/cmp-nvim-lua" -- nvim lua config completion

  use "neovim/nvim-lspconfig" -- LSP configuration
  use "williamboman/nvim-lsp-installer" -- Installation of LSP servers
  use "jose-elias-alvarez/null-ls.nvim" -- Formatting & diagnostics

  use "nvim-telescope/telescope.nvim" -- FZF files, live grep etc.

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  } -- Syntax highlighting etc.

  use "p00f/nvim-ts-rainbow" -- Colored open/closing parens
  use "windwp/nvim-autopairs" -- Automatically close pairs
  use "luukvbaal/nnn.nvim" -- nnn file explorer
  use "numToStr/Comment.nvim" -- Easy comments
  use "JoosepAlviste/nvim-ts-context-commentstring" -- Contextual comments
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end
  }) -- Surround plugin with default config
  use "akinsho/toggleterm.nvim" -- Floating terminal buffer
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  use "tpope/vim-fugitive" -- Git functionality
  use {
    'lewis6991/gitsigns.nvim', -- Git annotations in margins
    config = function()
      require('gitsigns').setup()
    end
  }

  use { 'alexghergh/nvim-tmux-navigation', config = function()
    require'nvim-tmux-navigation'.setup {
      disable_when_zoomed = true, -- defaults to false
      keybindings = {
        left = "<C-h>",
        down = "<C-j>",
        up = "<C-k>",
        right = "<C-l>",
        last_active = "<C-\\>",
        next = "<C-Space>",
      }
    }
    end
  } -- Navigation consistency with tmux panes

  -- Automatically configure after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
