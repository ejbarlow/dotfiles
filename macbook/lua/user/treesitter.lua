local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "all",
  -- ensure_installed = { "javascript", "typescript" },
  sync_install = false,
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  content_commentstring = {
    enable = true,
    enable_autocmd = false,
  }
}

local unfold = vim.api.nvim_create_augroup("Unfold", {})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  command = "normal zR",
  group = unfold,
})
