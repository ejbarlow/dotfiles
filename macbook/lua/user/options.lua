local options = {
	-- showtabline = 2,
	shiftwidth = 2,
	tabstop = 2,
	number = true,
	relativenumber = true,
	clipboard = "unnamedplus",
	completeopt = { "menuone", "noselect" },
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
  termguicolors = true,
	timeoutlen = 200,
	undofile = true,
	updatetime = 300,
	expandtab = true,
	cursorline = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = false,
	scrolloff = 8,
	sidescrolloff = 8,
  inccommand = "split",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
