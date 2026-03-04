local map = vim.keymap.set

-- Clear search highlighting with Enter
map("n", "<CR>", ":nohlsearch<CR>", { silent = true })

-- Window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Buffer navigation
map("n", "<leader>bn", ":bnext<CR>", { silent = true })
map("n", "<leader>bp", ":bprevious<CR>", { silent = true })
map("n", "<leader>bd", ":bdelete<CR>", { silent = true })

-- Neo-tree toggle (replaces NERDTree)
map("n", "<leader>n", ":Neotree toggle<CR>", { silent = true })

-- Telescope (replaces pick/fzf)
map("n", "<leader>t", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { silent = true })

-- Format JSON (replaces <leader>j)
map("n", "<leader>j", ":%!jq .<CR>", { silent = true })

-- Paste mode toggle
map("n", "<leader>p", ":set paste!<CR>", { silent = true })

-- Quick save
map("n", "<leader>w", ":w<CR>", { silent = true })

-- Move lines up and down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Keep cursor centered when scrolling
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Keep cursor centered when searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
