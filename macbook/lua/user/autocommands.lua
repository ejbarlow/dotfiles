local yankGroup = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank({ higroup=\"IncSearch\", timeout=500, on_visual=false})",
  group = yankGroup,
})
