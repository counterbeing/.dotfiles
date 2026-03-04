local opt = vim.opt

-- Leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation (2 spaces by default, matching old vimrc)
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false
opt.wrap = false

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Buffers
opt.hidden = true

-- Mouse
opt.mouse = "a"

-- Undo
opt.undofile = true

-- Clipboard
opt.clipboard = "unnamedplus"

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Misc
opt.updatetime = 250
opt.timeoutlen = 300
opt.swapfile = false
opt.backup = false

-- Filetype-specific indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "python" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
  end,
})
